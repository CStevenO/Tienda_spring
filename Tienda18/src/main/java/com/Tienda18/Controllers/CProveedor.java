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

import com.Tienda18.Modelo.MProveedor;
import com.Tienda18.Services.SProveedor;


@RestController
@RequestMapping("/proveedores")
public class CProveedor {

	@Autowired
	SProveedor proveedoresS;
	
	@GetMapping
	public ArrayList<MProveedor> obtener(){
		return proveedoresS.obtener();
	}
	
	@PostMapping
	public MProveedor crear(@RequestBody MProveedor proveedor) {
		return proveedoresS.guardar(proveedor);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MProveedor> obtenerPorId(@PathVariable("id") Long id){
		return proveedoresS.obtenerPorId(id);
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = proveedoresS.eliminar(id);
		if(eliminado) return "Proveedor Eliminado";
		else return "Error Eliminado Proveedor";
	}
}
