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

import com.Tienda18.Modelo.MUsuario;
import com.Tienda18.Services.SUsuario;

@RestController
@RequestMapping("/usuarios")
public class CUsuario {
	@Autowired
	SUsuario usuarioS;
	
	@GetMapping("/listar_usuarios")
	public ArrayList<MUsuario> obtener(){
		return usuarioS.obtener();
	}
	
	@PostMapping
	public MUsuario crear(@RequestBody MUsuario usuario) {
		return usuarioS.guardar(usuario);
	}
	
	@GetMapping(path = "{id}")
	public Optional<MUsuario> obtenerPorId(@PathVariable("id") Long id){
		return usuarioS.obtenerPorId(id);
	}
	
	@DeleteMapping(path = "{id}")
	public String eliminarPorId(@PathVariable("id") Long id) {
		boolean eliminado = usuarioS.eliminar(id);
		if(eliminado) return "Usuario Eliminado";
		else return "Error Eliminado Usuario";
	}
	
	@PostMapping(value = "/login")
	public Optional<MUsuario> obtenerLogin(@RequestBody MUsuario usuario){
		return usuarioS.login(usuario.getUsuario(), usuario.getPassword());
	}
}
