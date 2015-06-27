/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import POJO.Categoria;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import Controller.util.JsfUtil;
import Controller.util.PagingInfo;
import Facade.CategoriaFacade;
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
public class CategoriaController {

    public CategoriaController() {
        pagingInfo = new PagingInfo();
        converter = new CategoriaConverter();
    }
    private Categoria categoria = null;
    private List<Categoria> categoriaItems = null;
    private CategoriaFacade jpaController = null;
    private CategoriaConverter converter = null;
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

    public CategoriaFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (CategoriaFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "categoriaJpa");
        }
        return jpaController;
    }

    public SelectItem[] getCategoriaItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getCategoriaItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Categoria getCategoria() {
        if (categoria == null) {
            categoria = (Categoria) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCategoria", converter, null);
        }
        if (categoria == null) {
            categoria = new Categoria();
        }
        return categoria;
    }

    public String listSetup() {
        reset(true);
        return "categoria_list";
    }

    public String createSetup() {
        reset(false);
        categoria = new Categoria();
        return "categoria_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(categoria);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Categoria was successfully created.");
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
        return scalarSetup("categoria_detail");
    }

    public String editSetup() {
        return scalarSetup("categoria_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        categoria = (Categoria) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCategoria", converter, null);
        if (categoria == null) {
            String requestCategoriaString = JsfUtil.getRequestParameter("jsfcrud.currentCategoria");
            JsfUtil.addErrorMessage("The categoria with id " + requestCategoriaString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String categoriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, categoria);
        String currentCategoriaString = JsfUtil.getRequestParameter("jsfcrud.currentCategoria");
        if (categoriaString == null || categoriaString.length() == 0 || !categoriaString.equals(currentCategoriaString)) {
            String outcome = editSetup();
            if ("categoria_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit categoria. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(categoria);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Categoria was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentCategoria");
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
                JsfUtil.addSuccessMessage("Categoria was successfully deleted.");
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

    public List<Categoria> getCategoriaItems() {
        if (categoriaItems == null) {
            getPagingInfo();
            categoriaItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return categoriaItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "categoria_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "categoria_list";
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
        categoria = null;
        categoriaItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Categoria newCategoria = new Categoria();
        String newCategoriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, newCategoria);
        String categoriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, categoria);
        if (!newCategoriaString.equals(categoriaString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
