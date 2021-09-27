package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MCliente;
import com.Tienda18.Repositories.RCliente;

@Service
public class SCliente {

	@Autowired
	RCliente clienteR;
	
	public MCliente guardar(MCliente cliente) {
		return clienteR.save(cliente);
	}
	
	public Optional<MCliente> obtenerPorId(Long id){
		return clienteR.findById(id);
	}
	
	public ArrayList<MCliente> obtener(){
		return (ArrayList<MCliente>) clienteR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			clienteR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
