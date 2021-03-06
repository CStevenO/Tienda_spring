package com.Tienda18.Modelo;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="roles")
public class MRol {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rol;
	private String tipo;
	public MRol() {
	}
	public MRol(int rol, String tipo) {
		this.rol = rol;
		this.tipo = tipo;
	}
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	@Override
	public int hashCode() {
		return Objects.hash(rol, tipo);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MRol other = (MRol) obj;
		return rol == other.rol && Objects.equals(tipo, other.tipo);
	}
	@Override
	public String toString() {
		return "MRol [rol=" + rol + ", tipo=" + tipo + "]";
	}
	
}
