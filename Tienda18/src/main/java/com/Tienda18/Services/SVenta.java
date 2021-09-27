package com.Tienda18.Services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Tienda18.Modelo.MVenta;
import com.Tienda18.Repositories.RVenta;



@Service
public class SVenta {

	@Autowired
	RVenta ventaR;
	
	public MVenta guardar(MVenta venta) {
		return ventaR.save(venta);
	}
	
	public Optional<MVenta> obtenerPorId(Long id){
		return ventaR.findById(id);
	}
	
	public ArrayList<MVenta> obtener(){
		return (ArrayList<MVenta>) ventaR.findAll();
	}
	
	public boolean eliminar(Long id) {
		try {
			ventaR.deleteById(id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
