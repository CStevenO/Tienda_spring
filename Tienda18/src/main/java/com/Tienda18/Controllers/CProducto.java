package com.Tienda18.Controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda18.Modelo.MProducto;
import com.Tienda18.Services.SProducto;



@RestController
@RequestMapping("/productos")
public class CProducto {

	@Autowired
	SProducto productosS;
	
	@GetMapping
	public ArrayList<MProducto> obtener(){
		return productosS.obtener();
	}
	/*
	@PostMapping
	public MProducto crear(@RequestBody MProducto producto) {
		return productosS.guardar(producto);
	}*/
	
	@PostMapping
	public ArrayList<MProducto> crearTodos(@RequestBody ArrayList<MProducto> productos){
		return productosS.guardarTodos(productos);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MProducto> obtenerPorId(@PathVariable("id") Long id){
		return productosS.obtenerPorId(id);
	}
	
	@DeleteMapping
	public String eliminar() {
		boolean eliminado = productosS.eliminarTodos();
		if(eliminado) return "Productos Eliminados";
		else return "Error Eliminado Productos";
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = productosS.eliminar(id);
		if(eliminado) return "Producto Eliminado";
		else return "Error Eliminado Producto";
	}
}
