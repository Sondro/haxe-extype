package extype;

import buddy.BuddySuite;
import buddy.CompilationShould;
import utest.Assert;

class ReadOnlySetSuite extends BuddySuite {
    public function new() {
        describe("ReadOnlySet", {
            it("should pass", {
                final src = new OrderedSet();
                src.add(10);
                src.add(15);

                final dist = (src : ReadOnlySet<Int>);
                Assert.equals(src, dist);
                Assert.equals(2, dist.length);
                Assert.isTrue(dist.exists(10));
                Assert.same([10, 15], [ for(x in dist) x ]);
                Assert.same([10, 15], dist.array());
                Assert.equals("{10,15}", dist.toString());

                CompilationShould.failFor({
                    final set = (new OrderedSet<Int>() : ReadOnlySet<Int>);
                    set.add(10);
                });
            });
        });
    }
}