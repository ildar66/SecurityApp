package com.nri.ejb.websphere_deploy.INFORMIX_V92_1;

/**
 * WorkerEJBBeanAdaptorBinding_7ee08407
 */
public class WorkerEJBBeanAdaptorBinding_7ee08407 implements com.ibm.ws.ejbpersistence.beanextensions.BeanAdaptorBinding {
	/**
	 * getExtractor
	 */
	public com.ibm.ws.ejbpersistence.dataaccess.EJBExtractor getExtractor() {
		// extractor for com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanExtractor_7ee08407
		com.ibm.ws.ejbpersistence.dataaccess.AbstractEJBExtractor extractor =  new com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanExtractor_7ee08407();
		extractor.setPrimaryKeyColumns(new int[] {1});
		extractor.setDataColumns(new int[] {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16});
		return extractor;
	}
	/**
	 * getInjector
	 */
	public com.ibm.ws.ejbpersistence.beanextensions.EJBInjector getInjector() {
		return new com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanInjectorImpl_7ee08407();
	}
	/**
	 * getAdapter
	 */
	public com.ibm.websphere.ejbpersistence.EJBToRAAdapter getAdapter() {
		return com.ibm.ws.rsadapter.cci.WSRelationalRAAdapter.createAdapter();
	}
	/**
	 * getMetadata
	 */
	public Object[] getMetadata() {
		
		java.lang.String[] primarykey, subhomes, composedObjs, composedObjImpls;
		com.ibm.ObjectQuery.metadata.OSQLExternalCatalogEntry[] cat;
		com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef[] fields;
		cat = new com.ibm.ObjectQuery.metadata.OSQLExternalCatalogEntry[4];
		//-------------------------------------------------------------------------
		cat[0] = new com.ibm.ObjectQuery.metadata.OSQLExternalCatalogRDBAlias("WorkerEJB", "WorkerEJB1_Alias", "INFORMIX", "informix.workers", "WorkerEJB_WorkerEJB1_Table");

		//-------------------------------------------------------------------------
		fields = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef[16];

		fields[0] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("worker", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, true, 0, -1, 0);
		fields[1] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("company", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[2] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("man", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, true, 0, -1, 0);
		fields[3] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("workposition", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, true, 0, -1, 0);
		fields[4] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("division", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[5] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("lotusaddress", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[6] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("email", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[7] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("phone1", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[8] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("phone2", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[9] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("localphone", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[10] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("fax", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[11] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("mobilephone", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 40, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[12] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isactive", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 1, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[13] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isour", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 1, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, true, 0, -1, 0);
		fields[14] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("organization", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[15] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isservicestuff", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 1, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, true, 0, -1, 0);
		primarykey = new String[1];
		primarykey[0] = "worker";
		cat[1] = new com.ibm.ObjectQuery.metadata.OSQLExternalCatalogType("WorkerEJB", "WorkerEJB1_Table", null, fields, primarykey);

		//-------------------------------------------------------------------------
		fields = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef[16];

		fields[0] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("worker", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[1] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("company", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[2] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("man", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[3] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("workPosition", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[4] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("division", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[5] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("lotusAddress", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[6] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("email", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[7] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("phone1", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[8] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("phone2", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[9] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("localPhone", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[10] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("fax", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[11] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("mobilePhone", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._CHARACTER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[12] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isActive", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols.BOOLEAN, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[13] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isOur", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols.BOOLEAN, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[14] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("organization", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols._INTEGER, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		fields[15] = new com.ibm.ObjectQuery.metadata.OSQLExternalColumnDef("isServiceStuff", new String(), com.ibm.ObjectQuery.engine.OSQLSymbols.BOOLEAN, 0, com.ibm.ObjectQuery.engine.OSQLConstants.NO_TYPE, false, 0, -1, 0);
		primarykey = new String[1];
		primarykey[0] = "worker";
		cat[2] = new com.ibm.ObjectQuery.metadata.OSQLExternalCatalogType("WorkerEJB", "WorkerEJB_BO", "com.nri.ejb.WorkerEJBBean", fields, primarykey);

		//-------------------------------------------------------------------------
		composedObjs = null;
		composedObjImpls = null;
		subhomes = null;
		cat[3] = new com.ibm.ObjectQuery.metadata.OSQLExternalCatalogView("WorkerEJB", "WorkerEJB_WorkerEJB_BO", "WorkerEJB_WorkerEJB1_Alias", composedObjs, composedObjImpls, 
		"select t1.worker,t1.company,t1.man,t1.workposition,t1.division,_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.lotusaddress),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.email),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.phone1),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.phone2),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.localphone),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.fax),_converter(\"com.ibm.vap.converters.VapTrimStringConverter\",t1.mobilephone),_converter(\"com.ibm.vap.converters.VapStringToBooleanConverter\",t1.isactive),_converter(\"com.ibm.vap.converters.VapStringToBooleanConverter\",t1.isour),t1.organization,_converter(\"com.ibm.vap.converters.VapStringToBooleanConverter\",t1.isservicestuff) from _this t1", 
		null, subhomes, 
		0, null);



		return cat;
	}
	/**
	 * createDataAccessSpecs
	 */
	public java.util.Collection createDataAccessSpecs() throws javax.resource.ResourceException {
		com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec daSpec;
		com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl iSpec;
		java.util.Collection result = new java.util.ArrayList(6);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("Create");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("Create");
		daSpec.setInputRecordName("Create");
		daSpec.setOptimistic(false);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.CREATE_BEAN);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		result.add(daSpec);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("Remove");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("Remove");
		daSpec.setInputRecordName("Remove");
		daSpec.setOptimistic(false);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.REMOVE_BEAN);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		result.add(daSpec);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("Store");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("Store");
		daSpec.setInputRecordName("Store");
		daSpec.setOptimistic(false);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.STORE_BEAN);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		result.add(daSpec);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("StoreUsingOCC");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("Store");
		daSpec.setInputRecordName("Store");
		daSpec.setOptimistic(true);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.STORE_BEAN);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		result.add(daSpec);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("FindByPrimaryKey");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("FindByPrimaryKey");
		daSpec.setInputRecordName("FindByPrimaryKey");
		daSpec.setOptimistic(false);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.FIND_PK);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		daSpec.setReadAccess(true);
		daSpec.setAllowDuplicates(false);
		daSpec.setContainsDuplicates(false);
		daSpec.setSingleResult(true);
		daSpec.setExtractor(new com.ibm.ws.ejbpersistence.dataaccess.WholeRowExtractor(getExtractor()));
		result.add(daSpec);

		daSpec=com.ibm.ws.ejbpersistence.beanextensions.DataAccessSpecFactory.getDataAccessSpec();
		iSpec=new com.ibm.ws.rsadapter.cci.WSInteractionSpecImpl();
		iSpec.setFunctionSetName("com.nri.ejb.websphere_deploy.INFORMIX_V92_1.WorkerEJBBeanFunctionSet_7ee08407");
		iSpec.setFunctionName("FindByPrimaryKeyForUpdate");
		daSpec.setInteractionSpec(iSpec);
		daSpec.setSpecName("FindByPrimaryKey");
		daSpec.setInputRecordName("FindByPrimaryKey");
		daSpec.setOptimistic(false);
		daSpec.setType(com.ibm.ws.ejbpersistence.beanextensions.EJBDataAccessSpec.FIND_PK);
		daSpec.setQueryScope(new String[]{"WorkerEJB"});
		daSpec.setReadAccess(false);
		daSpec.setAllowDuplicates(false);
		daSpec.setContainsDuplicates(false);
		daSpec.setSingleResult(true);
		daSpec.setExtractor(new com.ibm.ws.ejbpersistence.dataaccess.WholeRowExtractor(getExtractor()));
		result.add(daSpec);

		return result;

	}
}
