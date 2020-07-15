class TreeNode {
    left = null;
    right = null;
    value = null;

    constructor(value) {
        this.value = value;
    }
}

class BinaryTree {
    constructor(value) {
        this.root = new TreeNode(value);
    }

    insert(value, node) {

        if (!node) {
            node = this.root
        }
        if (value > node.value) {
            if (node.right) {
                this.insert(value, node.right)
            } else {
                node.right = new TreeNode(value);
            }
        } else {
            if (node.left) {
                this.insert(value, node.left)
            } else {
                node.left = new TreeNode(value);
            }
        }
    }

    find(value, node) {
        if (!node) {
            node = this.root
        }
        
        if (node.value === value) {
            return node;
        }
        
        if (value > node.value) {
            if (node.right) {
                return this.find(value, node.right)
            }
        } else {
            if (node.left) {
                return this.find(value, node.left)
            } 
        }
    }
}

const tree = new BinaryTree(100);
tree.insert(50);
tree.insert(20);
tree.insert(3);
tree.insert(150);
tree.insert(1110);
tree.insert(70);

console.log(tree.find(20));
console.log(tree.find(1110));
console.log(JSON.stringify(tree));