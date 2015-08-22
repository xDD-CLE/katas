package weather;

import common.HasSpread;

public class SpreadFinder {
    private final MyIterator fIt;
    private HasSpread fMinSpread = null;

    public SpreadFinder(MyIterator theIt) {
        fIt = theIt;

    }

    public void find() {
        int aMinSpread = Integer.MAX_VALUE;

        while (fIt.hasNext()) {
            HasSpread aNext = fIt.next();
            int aSpread = aNext.getSpread();
            if (aSpread < aMinSpread) {
                aMinSpread = aSpread;
                fMinSpread = aNext;
            }
        }
    }

    public HasSpread getSmallestSpread() {
        return fMinSpread;
    }
}
