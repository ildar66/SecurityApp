package com.nri.sequence.ejb;
/**
 * Local interface for Enterprise Bean: SequenceSession
 */
public interface SequenceSessionLocal extends javax.ejb.EJBLocalObject {
	public int getNextNumberInSequence(String id);
}
