package com.Tienda18.Services;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.QuoteMode;
import org.springframework.web.multipart.MultipartFile;

import com.Tienda18.Modelo.MProducto;
import com.Tienda18.Modelo.MProveedor;

public class SCsvHelper {
	public static String TYPE = "text/csv";
	  static String[] HEADERs = { "codigo_producto", "nombre_producto", "nit_proveedor", "precio_compra", "iva_compra", "precio_venta" };
	  
	  public static boolean hasCSVFormat(MultipartFile file) {
		    if (TYPE.equals(file.getContentType())
		    		|| file.getContentType().equals("application/vnd.ms-excel")) {
		    	System.out.println("leyó archivo");
		      return true;
		    }
		    System.out.println("no leyo archivo");
		    return false;
  
		  }
	  public static List<MProducto> csvToTable(InputStream is) {
		    try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		        CSVParser csvParser = new CSVParser(fileReader,
		            CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {

		      List<MProducto> productoList = new ArrayList<>();
		      

		      Iterable<CSVRecord> csvRecords = csvParser.getRecords();
		      
		      if(csvRecords != null) {
	    		  System.out.println("");
	    		  
	    	  }else {
	    		  System.out.println("no hay");
	    	  }
		      

		      for (CSVRecord csvRecord : csvRecords) {
		    	  System.out.println(csvRecord.toString());
		    	  MProducto producto = new MProducto(
		              Long.parseLong(csvRecord.get("codigo_producto")),
		              csvRecord.get("nombre_producto"),
		              new MProveedor(Long.parseLong(csvRecord.get("nit_proveedor"))),
		              Double.parseDouble(csvRecord.get("precio_compra")),
		              Double.parseDouble(csvRecord.get("iva_compra")),
		              Double.parseDouble(csvRecord.get("precio_venta"))
		            );
		    	  
		    	  System.out.println(producto.toString());
		    	  productoList.add(producto);
		    	  
		    	  
		      }

		      return productoList;
		    } catch (IOException e) {
		      throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
		    }
		  }
	  
	  public static ByteArrayInputStream tableToCSV(List<MProducto> prodList) {
		    final CSVFormat format = CSVFormat.DEFAULT.withQuoteMode(QuoteMode.MINIMAL);

		    try (ByteArrayOutputStream out = new ByteArrayOutputStream();
		        CSVPrinter csvPrinter = new CSVPrinter(new PrintWriter(out), format);) {
		      for (MProducto producto : prodList) {
		        List<String> data = Arrays.asList(
		              String.valueOf(producto.getCodigo_producto()),
		              String.valueOf(producto.getIva_compra()),
		              producto.getNombre_producto(),
		              String.valueOf(producto.getPrecio_compra()),
		              String.valueOf(producto.getPrecio_venta()),
		              String.valueOf(producto.getNit_proveedor()));

		        csvPrinter.printRecord(data);
		      }

		      csvPrinter.flush();
		      return new ByteArrayInputStream(out.toByteArray());
		    } catch (IOException e) {
		      throw new RuntimeException("fail to import data to CSV file: " + e.getMessage());
		    }
		  }

}
