package com.Tienda18.Modelo;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Ventas")
public class MVenta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long codigo_venta;
	@ManyToOne(optional = false)
	@JoinColumn(name = "cedula_cliente",nullable=false)
	private MCliente cliente; 
	@ManyToOne(optional = false)
	@JoinColumn(name = "cedula_usuario",nullable=false)
	private MUsuario usuario;
	@Column(nullable=false)
	private double iva_venta;
	@Column(nullable=false)
	private double total_venta; 
	@Column(nullable=false)
	private double valor_venta;
	public MVenta(long codigo_venta, MCliente cliente, MUsuario usuario, double iva_venta, double total_venta,
			double valor_venta) {
		this.codigo_venta = codigo_venta;
		this.cliente = cliente;
		this.usuario = usuario;
		this.iva_venta = iva_venta;
		this.total_venta = total_venta;
		this.valor_venta = valor_venta;
	}
	public MVenta() {
	}
	public long getCodigo_venta() {
		return codigo_venta;
	}
	public void setCodigo_venta(long codigo_venta) {
		this.codigo_venta = codigo_venta;
	}
	public MCliente getCliente() {
		return cliente;
	}
	public void setCliente(MCliente cliente) {
		this.cliente = cliente;
	}
	public MUsuario getUsuario() {
		return usuario;
	}
	public void setUsuario(MUsuario usuario) {
		this.usuario = usuario;
	}
	public double getIva_venta() {
		return iva_venta;
	}
	public void setIva_venta(double iva_venta) {
		this.iva_venta = iva_venta;
	}
	public double getTotal_venta() {
		return total_venta;
	}
	public void setTotal_venta(double total_venta) {
		this.total_venta = total_venta;
	}
	public double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(double valor_venta) {
		this.valor_venta = valor_venta;
	}
	@Override
	public int hashCode() {
		return Objects.hash(cliente, codigo_venta, iva_venta, total_venta, usuario, valor_venta);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MVenta other = (MVenta) obj;
		return Objects.equals(cliente, other.cliente) && codigo_venta == other.codigo_venta
				&& Double.doubleToLongBits(iva_venta) == Double.doubleToLongBits(other.iva_venta)
				&& Double.doubleToLongBits(total_venta) == Double.doubleToLongBits(other.total_venta)
				&& Objects.equals(usuario, other.usuario)
				&& Double.doubleToLongBits(valor_venta) == Double.doubleToLongBits(other.valor_venta);
	}
	@Override
	public String toString() {
		return "MVenta [codigo_venta=" + codigo_venta + ", cliente=" + cliente + ", usuario=" + usuario + ", iva_venta="
				+ iva_venta + ", total_venta=" + total_venta + ", valor_venta=" + valor_venta + "]";
	} 
}
