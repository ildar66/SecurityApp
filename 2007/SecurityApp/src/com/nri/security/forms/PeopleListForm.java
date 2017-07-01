package com.nri.security.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * @version 	1.0
 * @author
 */
public class PeopleListForm extends ActionForm {
	private String searchStr = new String();
	private String orderBy = "lastName";
	private String activeState = "Y";

	private int startAtRow = 0;
	int howManyRows = 500;

	public void reset(ActionMapping mapping, HttpServletRequest request) {

		// Reset field values here.

	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errors = new ActionErrors();
		// Validate the fields in your form, adding
		// adding each error to this.errors as found, e.g.

		// if ((field == null) || (field.length() == 0)) {
		//   errors.add("field", new org.apache.struts.action.ActionError("error.field.required"));
		// }
		return errors;

	}
	/**
	 * @return
	 */
	public String getSearchStr() {
		return searchStr;
	}

	/**
	 * @param string
	 */
	public void setSearchStr(String string) {
		searchStr = string;
	}

	/**
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}

	/**
	 * @param string
	 */
	public void setOrderBy(String string) {
		orderBy = string;
	}

	/**
	 * @return
	 */
	public String getActiveState() {
		return activeState;
	}

	/**
	 * @param string
	 */
	public void setActiveState(String string) {
		activeState = string;
	}

	/**
	 * @return
	 */
	public int getHowManyRows() {
		return howManyRows;
	}

	/**
	 * @return
	 */
	public int getStartAtRow() {
		return startAtRow;
	}

	/**
	 * @param i
	 */
	public void setHowManyRows(int i) {
		howManyRows = Math.max(Math.abs(i), 1);
	}

	/**
	 * @param i
	 */
	public void setStartAtRow(int i) {
		startAtRow = Math.max(Math.abs(i), 0);
	}

}
