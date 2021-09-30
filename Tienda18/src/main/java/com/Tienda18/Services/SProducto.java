package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MProducto;
import com.Tienda18.Repositories.RProducto;


@Service
public class SProducto {

	@Autowired
	RProducto productoR;
	
	public MProducto guardar(MProducto producto) {
		return productoR.save(producto);
	}
	
	public ArrayList<MProducto> guardarTodos(ArrayList<MProducto> productos){
		return (ArrayList<MProducto>) productoR.saveAll(productos);
	}
	
	public Optional<MProducto> obtenerPorId(Long id){
		return productoR.findById(id);
	}
	
	public ArrayList<MProducto> obtener(){
		return (ArrayList<MProducto>) productoR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			productoR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean eliminarTodos() {
		try {
			productoR.deleteAll();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
