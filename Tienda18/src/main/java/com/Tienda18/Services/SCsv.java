package com.Tienda18.Services;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Tienda18.Modelo.MProducto;
import com.Tienda18.Repositories.RProducto;

@Service
public class SCsv {
	
	@Autowired
	RProducto prodR;
	
	public void save(MultipartFile file) {
	    try {
	      List<MProducto> productos = SCsvHelper.csvToTable(file.getInputStream());
	      prodR.saveAll(productos);
	    } catch (IOException e) {
	      throw new RuntimeException("Error al guardar archivo: " + e.getMessage());
	    }
	  }
	
	public List<MProducto> getAllProductos() {
	    return (List<MProducto>)prodR.findAll();
	  }

	public ByteArrayInputStream load() {
	    List<MProducto> productos = (List<MProducto>)prodR.findAll();

	    ByteArrayInputStream in = SCsvHelper.tableToCSV(productos);
	    return in;
	  }

	  public List<MProducto> getAllProds() {
	    return (List<MProducto>)prodR.findAll();
	  }
	
}
