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

import com.Tienda18.Modelo.MVenta;
import com.Tienda18.Services.SVenta;


@RestController
@RequestMapping("/ventas")
public class CVenta {

	@Autowired
	SVenta ventasS;
	
	@GetMapping
	public ArrayList<MVenta> obtener(){
		return ventasS.obtener();
	}
	
	@PostMapping
	public MVenta crear(@RequestBody MVenta venta) {
		return ventasS.guardar(venta);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MVenta> obtenerPorId(@PathVariable("id") Long id){
		return ventasS.obtenerPorId(id);
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = ventasS.eliminar(id);
		if(eliminado) return "Venta Eliminado";
		else return "Error Eliminado Venta";
	}
}
