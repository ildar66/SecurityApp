/*
 * Created on 30.07.2007
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.nri.tests.junit.ejb;

import java.math.BigDecimal;
import java.sql.Date;

import junit.framework.TestCase;

import com.nri.domain.Company;
import com.nri.domain.Division;
import com.nri.domain.DivisionType;
import com.nri.domain.MsUser;
import com.nri.domain.Operator;
import com.nri.domain.People;
import com.nri.domain.Profile;
import com.nri.domain.Role;
import com.nri.domain.WorkPosition;
import com.nri.domain.Worker;
import com.nri.exception.MappingException;
import com.nri.model.ActionProcessorFactory;
import com.nri.model.SecurityActionProcessor;
import com.nri.util.ApplProperties;

/**
 * @author IShaffigulin
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class NriActionProcessorTests extends TestCase {

	/**
	 * Constructor for NriActionProcessorTests.
	 * @param arg0
	 */
	public NriActionProcessorTests(String arg0) {
		super(arg0);
	}

	/* (non-Javadoc)
	 * @see junit.framework.TestCase#setUp()
	 */
	protected void setUp() throws Exception {
		if (ApplProperties.getCurrentMapperName().equals("EJB")) {
			//deleteAllRows();
		}
		if (ApplProperties.getCurrentMapperName().equals("MEMORY")) {
			deleteAllCache();
		}
	}

	/* (non-Javadoc)
	 * @see junit.framework.TestCase#tearDown()
	 */
	protected void tearDown() throws Exception {
		if (ApplProperties.getCurrentMapperName().equals("EJB")) {
			//deleteAllRows();
		}
		if (ApplProperties.getCurrentMapperName().equals("MEMORY")) {
			deleteAllCache();
		}
	}

	public void testAddFindDeleteRole() {

		// test adding, finding and removing a Role from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			String key = "99";
			Role purple = new Role();
			purple.setRole(key);
			purple.setRoleName("Role Purple 1");
			purple.setSortOrder(new Integer(1));
			purple.setComment("Role Purple 1 setComment");
			purple.setTaskComment("Role Purple 1 TaskComment");
			processor.addRole(purple);

			Role clone = processor.findRoleByKey(key);
			assertEquals("Names don't Match for Role", purple.getRoleName(), clone.getRoleName());

			processor.removeRole(key);

			try {
				processor.findRoleByKey(key);
				fail("Should have raised NoSuchRoleException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}
	public void testAddFindDeletePeople() {

		// test adding, finding and removing a People from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			//Integer key = new Integer(OIDGeneratorHelper.getNextId("tables.people"));
			People purple = new People(key);
			purple.setMan(key);
			purple.setFirstName("People Purple 1");
			purple.setLastName("People Purple 1");
			purple.setMiddleName("People Purple 1");
			purple.setIsActive(Boolean.TRUE);
			purple.setPassportDate(new Date(System.currentTimeMillis()));
			purple.setPassportSer("People Purple 1 PassportSer");
			purple.setPassportWhom("People Purple 1 PassportWhom");
			processor.addPeople(purple);

			People clone = processor.findPeopleByKey(key);
			assertEquals("Names don't Match for People", purple.getFirstName(), clone.getFirstName());

			processor.removePeople(key);

			try {
				processor.findPeopleByKey(key);
				fail("Should have raised NoSuchPeopleException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

	public void testAddFindDeleteWorkPosition() {

		// test adding, finding and removing a WorkPosition from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			WorkPosition purple = new WorkPosition();
			purple.setWorkPosition(key);
			purple.setName("WorkPosition Purple 1");
			purple.setIsActive(Boolean.TRUE);
			processor.addWorkPosition(purple);

			WorkPosition clone = processor.findWorkPositionByKey(key);
			assertEquals("Names don't Match for WorkPosition", purple.getName(), clone.getName());

			processor.removeWorkPosition(key);

			try {
				processor.findWorkPositionByKey(key);
				fail("Should have raised NoSuchWorkPositionException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

	public void testAddFindDeleteMsUser() {

		// test adding, finding and removing a MsUser from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			MsUser purple = new MsUser();
			purple.setMsuCode(key);
			purple.setMsUser("MsUser Purple 1");
			purple.setMsPassword("pass");
			processor.addMsUser(purple);

			MsUser clone = processor.findMsUserByKey(key);
			assertEquals("Names don't Match for MsUser", purple.getMsUser(), clone.getMsUser());

			processor.removeMsUser(key);

			try {
				processor.findMsUserByKey(key);
				fail("Should have raised NoSuchMsUserException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

	/**
	 * Method deleteAllCache.
	 */
	private void deleteAllCache() {
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");
		processor.clearInMemoryCaches();
	}

	public void testAddFindDeleteCompany() {

		// test adding, finding and removing a Company from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			Company purple = new Company();
			purple.setCompany(key);
			purple.setName("Company Purple 1");
			purple.setShortName("ShortName");
			processor.addCompany(purple);

			Company clone = processor.findCompanyByKey(key);
			assertEquals("Names don't Match for Company", purple.getName(), clone.getName());

			processor.removeCompany(key);

			try {
				processor.findCompanyByKey(key);
				fail("Should have raised NoSuchCompanyException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

	public void testAddFindDeleteDivision() {

		// test adding, finding and removing a Division from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			Division purple = new Division(key, DivisionType.getService(), "Service", Boolean.TRUE);
			purple.setShortName("ShortName");
			processor.addDivision(purple);

			Division clone = processor.findDivisionByKey(key);
			assertEquals("Names don't Match for Division", purple.getName(), clone.getName());

			processor.removeDivision(key);

			try {
				processor.findDivisionByKey(key);
				fail("Should have raised NoSuchDivisionException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

	public void testAddFindDeleteWorker() {

		// test adding, finding and removing a Worker from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			Integer man = new Integer("1");
			Integer workPosition = new Integer("1");
			Worker purple = new Worker(key, man, workPosition, Boolean.TRUE, Boolean.TRUE);
			processor.addWorker(purple);

			Worker clone = processor.findWorkerByKey(key);
			assertEquals("Man don't Match for Worker", purple.getMan(), clone.getMan());

			processor.removeWorker(key);

			try {
				processor.findWorkerByKey(key);
				fail("Should have raised NoSuchWorkerException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}
	public void testAddFindDeleteOperator() {

		// test adding, finding and removing a Operator from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Integer key = new Integer("-1");
			Integer man = new Integer(1);
			Operator purple = new Operator(key, man, "LoginTemp", "pass", Boolean.TRUE);
			processor.addOperator(purple);

			Operator clone = processor.findOperatorByKey(key);
			assertEquals("LoginID don't Match for Operator", purple.getLoginID(), clone.getLoginID());

			processor.removeOperator(key);

			try {
				processor.findOperatorByKey(key);
				fail("Should have raised NoSuchOperatorException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}
	
	public void testAddFindDeleteProfile() {

		// test adding, finding and removing a Profile from the model
		SecurityActionProcessor processor = (SecurityActionProcessor) ActionProcessorFactory.getActionProcessor("Security");

		try {
			Profile nriObjectKey = new Profile(new Integer(602), "SYSTEM", "TERRABYTE_SERVER");

			Profile purple = new Profile(nriObjectKey.getOperatorID(), nriObjectKey.getKey(), nriObjectKey.getName());
			purple.setType(new Integer("1")); //1-5(check)
			purple.setKey_type(new Integer("1")); //0 ��� 1(check)
			purple.setNum_value(new BigDecimal("-1.0000"));
			processor.addProfile(purple);

			Profile clone = processor.findProfileByKey(nriObjectKey);
			assertEquals("Names don't Match for Profile", purple.getName(), clone.getName());
			assertEquals("Keys don't Match for Profile", purple.getKey(), clone.getKey());
			assertEquals("Num_values don't Match for Profile", purple.getNum_value(), clone.getNum_value());

			processor.removeProfile(nriObjectKey);

			try {
				processor.findProfileByKey(nriObjectKey);
				fail("Should have raised NoSuchProfileException");
			} catch (Exception e) {
				// Eat it -- it should fail
			}

		} catch (MappingException e) {
			fail("MappingException caught " + e);
		}

	}

}
