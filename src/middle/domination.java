package middle;

import IR.*;
import IR.node.*;
import IR.instruction.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;


public class domination {

    ir_program program;

    domination(ir_program program) {
        this.program = program;
    }

    public void output_dom(function_definition_node function) {
        for (var block : function.body) {
            System.out.print(block.label + " : ");
            for (var dom : block.son) {
                System.out.print(dom.label + " ");
            }
            System.out.println();
        }
    }


    private void bfs(function_definition_node function, ArrayList<basic_block> bfs_order) {
        ArrayList<basic_block> queue = new ArrayList<>();
        queue.add(function.body.get(0));
        while (!queue.isEmpty()) {
            basic_block current = queue.get(0);
            queue.remove(0);
            bfs_order.add(current);
            for (basic_block successor : current.successors) {
                if (!bfs_order.contains(successor) && !queue.contains(successor)) {
                    queue.add(successor);
                }
            }
        }
        for(var block : function.body){
            for(var add : function.body){
                block.dom.add(add);
            }
        }
    }

    private boolean recycle_dom(ArrayList<basic_block> bfs_order) {
        boolean changed = false;
        for (int i = bfs_order.size() -1; i >=0 ; i--) {
            basic_block current = bfs_order.get(i);
            HashSet<basic_block> new_dom = new HashSet<>();
            boolean j = false;
            for (basic_block predecessor : current.predecessors) {
                if (!j) {
                    new_dom = new HashSet<>(predecessor.dom);
                    j = true;
                } else {
                    intersection(new_dom, predecessor.dom);
                }
            }
            new_dom.add(current);

            if (!new_dom.equals(current.dom)) {
                current.dom = new_dom;
                changed = true;
            }
        }
        return changed;
    }

    public void work_function_domset(function_definition_node node) {
        ArrayList<basic_block> bfs_order = new ArrayList<>();
        bfs(node, bfs_order);
        basic_block entry = node.body.get(0);
        boolean changed = true;
        while (changed) {
            changed = recycle_dom(bfs_order);
//            output_dom(node);
//            System.out.println();
        }
        entry.dom = new HashSet<>();
        entry.dom.add(entry);
    }

    public void work_domset() {
        for (var name : program.function_definition_nodeHashMap.keySet()) {
            work_function_domset(program.function_definition_nodeHashMap.get(name));
        }

    }

    public void find_direct_dom() {
        for (var name : program.function_definition_nodeHashMap.keySet()) {
            function_definition_node function = program.function_definition_nodeHashMap.get(name);
            for (int i = 0; i < function.body.size(); ++i) {
                basic_block current = function.body.get(i);
                for (basic_block dom_node : current.dom) {
                    if (dom_node.dom.size() == current.dom.size() - 1) {
                        current.direct_dom_node = dom_node;
                        dom_node.son.add(current);
                        break;
                    }
                }
            }
            var entry = function.body.get(0);
            for(var block : entry.successors){
                entry.son.add(block);
                block.direct_dom_node = entry;
            }
        }
    }

    public void find_frontier() {
        for (var name : program.function_definition_nodeHashMap.keySet()) {
            function_definition_node function = program.function_definition_nodeHashMap.get(name);
            for (basic_block block : function.body) {
                for (basic_block pre : block.predecessors) {
                    var dom_m = pre.dom;
                    for (var runner : dom_m) {
                        if (!block.dom.contains(runner) || runner.equals(block)) {
                            runner.dom_frontier.add(block);
                        }
                    }
                }
            }
        }
    }

    public void intersection(HashSet<basic_block> a, HashSet<basic_block> b) {
        HashSet<basic_block> copy = new HashSet<>(a);
        for (basic_block block : copy) {
            if (!b.contains(block)) {
                a.remove(block);
            }
        }
    }

    public void work() {
        work_domset();
        find_direct_dom();
        find_frontier();
//        for (var name : program.function_definition_nodeHashMap.keySet()) {
//            output_dom(program.function_definition_nodeHashMap.get(name));
//        }


    }


}