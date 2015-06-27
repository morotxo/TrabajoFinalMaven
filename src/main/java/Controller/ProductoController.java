/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import POJO.Producto;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import Controller.util.JsfUtil;
import Controller.util.PagingInfo;
import Facade.ProductoFacade;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author david13mo
 */
public class ProductoController {

    public ProductoController() {
        pagingInfo = new PagingInfo();
        converter = new ProductoConverter();
    }
    private Producto producto = null;
    private List<Producto> productoItems = null;
    private ProductoFacade jpaController = null;
    private ProductoConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "com.mycompany_ProyectoFinalPW_war_1.0-SNAPSHOTPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public ProductoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ProductoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "productoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getProductoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getProductoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Producto getProducto() {
        if (producto == null) {
            producto = (Producto) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentProducto", converter, null);
        }
        if (producto == null) {
            producto = new Producto();
        }
        return producto;
    }

    public String listSetup() {
        reset(true);
        return "producto_list";
    }

    public String createSetup() {
        reset(false);
        producto = new Producto();
        return "producto_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(producto);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Producto was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("producto_detail");
    }

    public String editSetup() {
        return scalarSetup("producto_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        producto = (Producto) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentProducto", converter, null);
        if (producto == null) {
            String requestProductoString = JsfUtil.getRequestParameter("jsfcrud.currentProducto");
            JsfUtil.addErrorMessage("The producto with id " + requestProductoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String productoString = converter.getAsString(FacesContext.getCurrentInstance(), null, producto);
        String currentProductoString = JsfUtil.getRequestParameter("jsfcrud.currentProducto");
        if (productoString == null || productoString.length() == 0 || !productoString.equals(currentProductoString)) {
            String outcome = editSetup();
            if ("producto_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit producto. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(producto);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Producto was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentProducto");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Producto was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Producto> getProductoItems() {
        if (productoItems == null) {
            getPagingInfo();
            productoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return productoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "producto_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "producto_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        producto = null;
        productoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Producto newProducto = new Producto();
        String newProductoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newProducto);
        String productoString = converter.getAsString(FacesContext.getCurrentInstance(), null, producto);
        if (!newProductoString.equals(productoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
