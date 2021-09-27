package com.Tienda18.Modelo;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="proveedores")
public class MProveedor {

	@Id
	@Column(nullable=false)
	private long nit_proveedor;
	private String ciudad_proveedor;
	private String direccion_proveedor;
	private String nombre_proveedor;
	private String telefono_proveedor;
	public MProveedor(long nit_proveedor, String ciudad_proveedor, String direccion_proveedor, String nombre_proveedor,
			String telefono_proveedor) {
		this.nit_proveedor = nit_proveedor;
		this.ciudad_proveedor = ciudad_proveedor;
		this.direccion_proveedor = direccion_proveedor;
		this.nombre_proveedor = nombre_proveedor;
		this.telefono_proveedor = telefono_proveedor;
	}
	public MProveedor() {
	}
	public long getNit_proveedor() {
		return nit_proveedor;
	}
	public void setNit_proveedor(long nit_proveedor) {
		this.nit_proveedor = nit_proveedor;
	}
	public String getCiudad_proveedor() {
		return ciudad_proveedor;
	}
	public void setCiudad_proveedor(String ciudad_proveedor) {
		this.ciudad_proveedor = ciudad_proveedor;
	}
	public String getDireccion_proveedor() {
		return direccion_proveedor;
	}
	public void setDireccion_proveedor(String direccion_proveedor) {
		this.direccion_proveedor = direccion_proveedor;
	}
	public String getNombre_proveedor() {
		return nombre_proveedor;
	}
	public void setNombre_proveedor(String nombre_proveedor) {
		this.nombre_proveedor = nombre_proveedor;
	}
	public String getTelefono_proveedor() {
		return telefono_proveedor;
	}
	public void setTelefono_proveedor(String telefono_proveedor) {
		this.telefono_proveedor = telefono_proveedor;
	}
	@Override
	public int hashCode() {
		return Objects.hash(ciudad_proveedor, direccion_proveedor, nit_proveedor, nombre_proveedor, telefono_proveedor);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MProveedor other = (MProveedor) obj;
		return Objects.equals(ciudad_proveedor, other.ciudad_proveedor)
				&& Objects.equals(direccion_proveedor, other.direccion_proveedor)
				&& nit_proveedor == other.nit_proveedor && Objects.equals(nombre_proveedor, other.nombre_proveedor)
				&& Objects.equals(telefono_proveedor, other.telefono_proveedor);
	}
	@Override
	public String toString() {
		return "MProveedor [nit_proveedor=" + nit_proveedor + ", ciudad_proveedor=" + ciudad_proveedor
				+ ", direccion_proveedor=" + direccion_proveedor + ", nombre_proveedor=" + nombre_proveedor
				+ ", telefono_proveedor=" + telefono_proveedor + "]";
	}
}
