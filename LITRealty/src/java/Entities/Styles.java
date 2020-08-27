/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author K00199771
 */
@Entity
@Table(name = "styles")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Styles.findAll", query = "SELECT s FROM Styles s")
    , @NamedQuery(name = "Styles.findByStyleId", query = "SELECT s FROM Styles s WHERE s.styleId = :styleId")
    , @NamedQuery(name = "Styles.findByPStyle", query = "SELECT s FROM Styles s WHERE s.pStyle = :pStyle")})
public class Styles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "styleId")
    private Integer styleId;
    @Column(name = "pStyle")
    private String pStyle;

    public Styles() {
    }

    public Styles(Integer styleId) {
        this.styleId = styleId;
    }

    public Integer getStyleId() {
        return styleId;
    }

    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    public String getPStyle() {
        return pStyle;
    }

    public void setPStyle(String pStyle) {
        this.pStyle = pStyle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (styleId != null ? styleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Styles)) {
            return false;
        }
        Styles other = (Styles) object;
        if ((this.styleId == null && other.styleId != null) || (this.styleId != null && !this.styleId.equals(other.styleId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Styles[ styleId=" + styleId + " ]";
    }
    
}
