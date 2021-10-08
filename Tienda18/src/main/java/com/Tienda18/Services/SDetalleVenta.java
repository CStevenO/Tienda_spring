package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MDetalleVenta;
import com.Tienda18.Repositories.RDetalleVenta;



@Service
public class SDetalleVenta {
	@Autowired
	RDetalleVenta detalleVentaR;
	
	public MDetalleVenta guardar(MDetalleVenta detalle) {
		return detalleVentaR.save(detalle);
	}
	
	public ArrayList<MDetalleVenta> guardarTodos(ArrayList<MDetalleVenta> detalles){
		return (ArrayList<MDetalleVenta>) detalleVentaR.saveAll(detalles);
	}
	
	public Optional<MDetalleVenta> obtenerPorId(Long id){
		return detalleVentaR.findById(id);
	}
	
	public ArrayList<MDetalleVenta> obtener(){
		return (ArrayList<MDetalleVenta>) detalleVentaR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			detalleVentaR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
