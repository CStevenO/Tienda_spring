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

import com.Tienda18.Modelo.MCliente;
import com.Tienda18.Services.SCliente;



@RestController
@RequestMapping("/clientes")
public class CCliente {
	@Autowired
	SCliente clienteS;
	
	@GetMapping
	public ArrayList<MCliente> obtener(){
		return clienteS.obtener();
	}
	
	@PostMapping
	public MCliente crear(@RequestBody MCliente cliente) {
		return clienteS.guardar(cliente);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MCliente> obtenerPorId(@PathVariable("id") Long id){
		return clienteS.obtenerPorId(id);
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = clienteS.eliminar(id);
		if(eliminado) return "Cliente Eliminado";
		else return "Error Eliminado Cliente";
	}
}
