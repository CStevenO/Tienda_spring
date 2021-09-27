package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MRol;
import com.Tienda18.Repositories.RRol;



@Service
public class SRol {

	@Autowired
	RRol rolR;
	
	public MRol guardar(MRol rol) {
		return rolR.save(rol);
	}
	
	public Optional<MRol> obtenerPorId(int id){
		return rolR.findById(id);
	}
	
	public ArrayList<MRol> obtener(){
		return (ArrayList<MRol>) rolR.findAll();
	}
	
	public boolean eliminar(int id) {
		try {
			rolR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
