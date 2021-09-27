package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MProveedor;
import com.Tienda18.Repositories.RProveedor;



@Service
public class SProveedor {

	@Autowired
	RProveedor proveedorR;
	
	public MProveedor guardar(MProveedor usuario) {
		return proveedorR.save(usuario);
	}
	
	public Optional<MProveedor> obtenerPorId(Long id){
		return proveedorR.findById(id);
	}
	
	public ArrayList<MProveedor> obtener(){
		return (ArrayList<MProveedor>) proveedorR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			proveedorR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
