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

import com.Tienda18.Modelo.MDetalleVenta;
import com.Tienda18.Services.SDetalleVenta;


@RestController
@RequestMapping("/DetalleVentas")
public class CDetalleVenta {

	@Autowired
	SDetalleVenta DetalleS;
	
	@GetMapping
	public ArrayList<MDetalleVenta> obtener(){
		return DetalleS.obtener();
	}
	
	@PostMapping
	public MDetalleVenta crear(@RequestBody MDetalleVenta detalle) {
		return DetalleS.guardar(detalle);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MDetalleVenta> obtenerPorId(@PathVariable("id") Long id){
		return DetalleS.obtenerPorId(id);
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = DetalleS.eliminar(id);
		if(eliminado) return "Detalle Ventas Eliminado";
		else return "Error Eliminado Detalle Ventas";
	}
}
