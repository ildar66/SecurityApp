package com.nri.ejb.websphere_deploy.INFORMIX_V92_1;

/**
 * MsUserEJBBeanInjectorImpl_da8ec80c
 */
public class MsUserEJBBeanInjectorImpl_da8ec80c implements com.nri.ejb.websphere_deploy.MsUserEJBBeanInjector_da8ec80c {
	/**
	 * ejbCreate
	 */
	public void ejbCreate(com.ibm.ws.ejbpersistence.beanextensions.ConcreteBean cb, javax.resource.cci.IndexedRecord record) {
		com.nri.ejb.ConcreteMsUserEJB_da8ec80c concreteBean=(com.nri.ejb.ConcreteMsUserEJB_da8ec80c)cb;
		record.set(0,concreteBean.getMsuCode());
		record.set(1,com.ibm.vap.converters.VapTrimStringConverter.singleton().dataFrom(concreteBean.getMsUser()));
		record.set(2,com.ibm.vap.converters.VapTrimStringConverter.singleton().dataFrom(concreteBean.getMsPassword()));
	}
	/**
	 * ejbStore
	 */
	public void ejbStore(com.ibm.ws.ejbpersistence.beanextensions.ConcreteBean cb, javax.resource.cci.IndexedRecord record) {
		com.nri.ejb.ConcreteMsUserEJB_da8ec80c concreteBean=(com.nri.ejb.ConcreteMsUserEJB_da8ec80c)cb;
		record.set(0,concreteBean.getMsuCode());
		record.set(1,com.ibm.vap.converters.VapTrimStringConverter.singleton().dataFrom(concreteBean.getMsUser()));
		record.set(2,com.ibm.vap.converters.VapTrimStringConverter.singleton().dataFrom(concreteBean.getMsPassword()));
	}
	/**
	 * ejbRemove
	 */
	public void ejbRemove(com.ibm.ws.ejbpersistence.beanextensions.ConcreteBean cb, javax.resource.cci.IndexedRecord record) {
		com.nri.ejb.ConcreteMsUserEJB_da8ec80c concreteBean=(com.nri.ejb.ConcreteMsUserEJB_da8ec80c)cb;
		record.set(0,concreteBean.getMsuCode());
	}
	/**
	 * ejbFindByPrimaryKey
	 */
	public void ejbFindByPrimaryKey(Object pkeyObject, javax.resource.cci.IndexedRecord record) {
		java.lang.Integer pkey=(java.lang.Integer)pkeyObject;
		record.set(0,pkey);
	}
}
