/*
 * Copyright 2015 GenomOncology, LLC
 * CONFIDENTIAL
 * This document contains trade secrets or otherwise confidential information owned by GenomOncology, LLC.
 * Access to and use of this information is strictly limited and controlled by GenomOncology, LLC. This
 * document may not be copied, distributed, or otherwise disclosed outside of GenomOncology, LLC's facilities
 * except under appropriate precautions to maintain the confidentiality hereof, and may not be used in any
 * way not expressly authorized by GenomOncology, LLC.
 */

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AdderTest {
    
    @Test
    public void testAdd() {
        Adder adder = new Adder();
        assertEquals(0, adder.add(""));
        assertEquals(1, adder.add("1"));
        assertEquals(3, adder.add("1,2"));
        assertEquals(15, adder.add("1,2,3,4,5"));
        assertEquals(6, adder.add("1\n2,3"));
        assertEquals(3, adder.add("//;\n1;2"));
    }
}

