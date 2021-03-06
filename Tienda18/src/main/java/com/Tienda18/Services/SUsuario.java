package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MUsuario;
import com.Tienda18.Repositories.RUsuario;

@Service
public class SUsuario {

	@Autowired
	RUsuario usuarioR;
	
	public MUsuario guardar(MUsuario usuario) {
		return usuarioR.save(usuario);
	}
	
	public Optional<MUsuario> obtenerPorId(Long id){
		return usuarioR.findById(id);
	}
	
	public ArrayList<MUsuario> obtener(){
		return (ArrayList<MUsuario>) usuarioR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			usuarioR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Optional<MUsuario> login(String usuario,String password) {
		ArrayList<MUsuario> usuarios = (ArrayList<MUsuario>)usuarioR.findAll();
		for(MUsuario usu:usuarios){
			if(usu.getUsuario().equals(usuario) && usu.getPassword().equals(password)) {
				return Optional.of(usu);
			}
		}
		return Optional.of(new MUsuario());
	}
}
