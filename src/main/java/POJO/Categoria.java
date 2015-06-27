/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david13mo
 */
@Entity
@Table(catalog = "tienda", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Categoria.findAll", query = "SELECT c FROM Categoria c"),
    @NamedQuery(name = "Categoria.findByIdCATEGORIA", query = "SELECT c FROM Categoria c WHERE c.idCATEGORIA = :idCATEGORIA"),
    @NamedQuery(name = "Categoria.findByNombre", query = "SELECT c FROM Categoria c WHERE c.nombre = :nombre"),
    @NamedQuery(name = "Categoria.findByEstado", query = "SELECT c FROM Categoria c WHERE c.estado = :estado")})
public class Categoria implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer idCATEGORIA;
    @Size(max = 45)
    @Column(length = 45)
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Character estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCATEGORIA")
    private List<Producto> productoList;

    public Categoria() {
    }

    public Categoria(Integer idCATEGORIA) {
        this.idCATEGORIA = idCATEGORIA;
    }

    public Categoria(Integer idCATEGORIA, Character estado) {
        this.idCATEGORIA = idCATEGORIA;
        this.estado = estado;
    }

    public Integer getIdCATEGORIA() {
        return idCATEGORIA;
    }

    public void setIdCATEGORIA(Integer idCATEGORIA) {
        this.idCATEGORIA = idCATEGORIA;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Character getEstado() {
        return estado;
    }

    public void setEstado(Character estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCATEGORIA != null ? idCATEGORIA.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categoria)) {
            return false;
        }
        Categoria other = (Categoria) object;
        if ((this.idCATEGORIA == null && other.idCATEGORIA != null) || (this.idCATEGORIA != null && !this.idCATEGORIA.equals(other.idCATEGORIA))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Controller.Categoria[ idCATEGORIA=" + idCATEGORIA + " ]";
    }
    
}
