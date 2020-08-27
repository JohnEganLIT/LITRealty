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
@Table(name = "garagetypes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Garagetypes.findAll", query = "SELECT g FROM Garagetypes g")
    , @NamedQuery(name = "Garagetypes.findByGarageId", query = "SELECT g FROM Garagetypes g WHERE g.garageId = :garageId")
    , @NamedQuery(name = "Garagetypes.findByGType", query = "SELECT g FROM Garagetypes g WHERE g.gType = :gType")})
public class Garagetypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "garageId")
    private Integer garageId;
    @Column(name = "gType")
    private String gType;

    public Garagetypes() {
    }

    public Garagetypes(Integer garageId) {
        this.garageId = garageId;
    }

    public Integer getGarageId() {
        return garageId;
    }

    public void setGarageId(Integer garageId) {
        this.garageId = garageId;
    }

    public String getGType() {
        return gType;
    }

    public void setGType(String gType) {
        this.gType = gType;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (garageId != null ? garageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Garagetypes)) {
            return false;
        }
        Garagetypes other = (Garagetypes) object;
        if ((this.garageId == null && other.garageId != null) || (this.garageId != null && !this.garageId.equals(other.garageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Garagetypes[ garageId=" + garageId + " ]";
    }
    
}
