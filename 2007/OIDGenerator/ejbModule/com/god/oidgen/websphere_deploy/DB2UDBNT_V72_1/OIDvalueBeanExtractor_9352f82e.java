package com.god.oidgen.websphere_deploy.DB2UDBNT_V72_1;

/**
 * OIDvalueBeanExtractor_9352f82e
 */
public class OIDvalueBeanExtractor_9352f82e extends com.ibm.ws.ejbpersistence.dataaccess.AbstractEJBExtractor {
	/**
	 * OIDvalueBeanExtractor_9352f82e
	 */
	public OIDvalueBeanExtractor_9352f82e() {
		int[] pkCols={1};
		setPrimaryKeyColumns(pkCols);

		int[] dataCols={1,2};
		setDataColumns(dataCols);
	}
	/**
	 * extractData
	 */
	public com.ibm.ws.ejbpersistence.cache.DataCacheEntry extractData(com.ibm.ws.ejbpersistence.dataaccess.RawBeanData dataRow) throws com.ibm.ws.ejbpersistence.utilpm.ErrorProcessingResultCollectionRow, com.ibm.ws.ejbpersistence.utilpm.PersistenceManagerInternalError {
		int[] dataColumns = getDataColumns();

		com.god.oidgen.websphere_deploy.DB2UDBNT_V72_1.OIDvalueBeanCacheEntryImpl_9352f82e entry=
			new com.god.oidgen.websphere_deploy.DB2UDBNT_V72_1.OIDvalueBeanCacheEntryImpl_9352f82e();

		entry.setDataForTYPE1(dataRow.getString(dataColumns[0]));
		entry.setDataForNEXTOID(dataRow.getInt(dataColumns[1]));

		return entry;
	}
	/**
	 * extractPrimaryKey
	 */
	public Object extractPrimaryKey(com.ibm.ws.ejbpersistence.dataaccess.RawBeanData dataRow) throws com.ibm.ws.ejbpersistence.utilpm.ErrorProcessingResultCollectionRow, com.ibm.ws.ejbpersistence.utilpm.PersistenceManagerInternalError {
		int[] primaryKeyColumns = getPrimaryKeyColumns();

		java.lang.String key;
		key=dataRow.getString(primaryKeyColumns[0]);

		return key;
	}
	/**
	 * getHomeName
	 */
	public String getHomeName() {
		return "OIDvalue";
	}
	/**
	 * getChunkLength
	 */
	public int getChunkLength() {
		return 2;
	}
}
