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
@Table(name="Detalle_Ventas")
public class MDetalleVenta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long codigo_detalle_venta; 
	@Column(nullable=false)
	private int cantidad_producto; 
	@ManyToOne(optional = false)
	@JoinColumn(name = "codigo_producto",nullable=false)
	private MProducto producto;
	@ManyToOne(optional = false)
	@JoinColumn(name = "codigo_venta",nullable=false)
	private MVenta venta; 
	@Column(nullable=false)
	private double valor_total;
	@Column(nullable=false)
	private double valor_venta;
	@Column(nullable=false)
	private double valor_iva;
	public MDetalleVenta(long codigo_detalle_venta, int cantidad_producto, MProducto producto, MVenta venta,
			double valor_total, double valor_venta, double valor_iva) {
		this.codigo_detalle_venta = codigo_detalle_venta;
		this.cantidad_producto = cantidad_producto;
		this.producto = producto;
		this.venta = venta;
		this.valor_total = valor_total;
		this.valor_venta = valor_venta;
		this.valor_iva = valor_iva;
	}
	public MDetalleVenta() {
	}
	public long getCodigo_detalle_venta() {
		return codigo_detalle_venta;
	}
	public void setCodigo_detalle_venta(long codigo_detalle_venta) {
		this.codigo_detalle_venta = codigo_detalle_venta;
	}
	public int getCantidad_producto() {
		return cantidad_producto;
	}
	public void setCantidad_producto(int cantidad_producto) {
		this.cantidad_producto = cantidad_producto;
	}
	public MProducto getProducto() {
		return producto;
	}
	public void setProducto(MProducto producto) {
		this.producto = producto;
	}
	public MVenta getVenta() {
		return venta;
	}
	public void setVenta(MVenta venta) {
		this.venta = venta;
	}
	public double getValor_total() {
		return valor_total;
	}
	public void setValor_total(double valor_total) {
		this.valor_total = valor_total;
	}
	public double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(double valor_venta) {
		this.valor_venta = valor_venta;
	}
	public double getValor_iva() {
		return valor_iva;
	}
	public void setValor_iva(double valor_iva) {
		this.valor_iva = valor_iva;
	}
	@Override
	public int hashCode() {
		return Objects.hash(cantidad_producto, codigo_detalle_venta, producto, valor_iva, valor_total, valor_venta,
				venta);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MDetalleVenta other = (MDetalleVenta) obj;
		return cantidad_producto == other.cantidad_producto && codigo_detalle_venta == other.codigo_detalle_venta
				&& Objects.equals(producto, other.producto)
				&& Double.doubleToLongBits(valor_iva) == Double.doubleToLongBits(other.valor_iva)
				&& Double.doubleToLongBits(valor_total) == Double.doubleToLongBits(other.valor_total)
				&& Double.doubleToLongBits(valor_venta) == Double.doubleToLongBits(other.valor_venta)
				&& Objects.equals(venta, other.venta);
	}
	@Override
	public String toString() {
		return "MDetalleVenta [codigo_detalle_venta=" + codigo_detalle_venta + ", cantidad_producto="
				+ cantidad_producto + ", producto=" + producto + ", venta=" + venta + ", valor_total=" + valor_total
				+ ", valor_venta=" + valor_venta + ", valor_iva=" + valor_iva + "]";
	}
	
}
