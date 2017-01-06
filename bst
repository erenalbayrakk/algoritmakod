# include <stdio.h>
# include <conio.h>
# include <stdlib.h>
 
typedef struct BST {
   int data;
   struct BST *lchild, *rchild;
} node;
 
void insert(node *, node *);
void inorder(node *);
void preorder(node *);
void postorder(node *);
node *search(node *, int, node **);
 
void main() {
   int choice;
   char ans = 'N';
   int key;
   node *new_node, *root, *tmp, *parent;
   node *get_node();
   root = NULL;
   
 
   
   do {
      printf("Olustur");
      printf("\nAra");
      printf("\nÖzyinelemeli Gidiş");
  
      printf("\nseçim yap:");
      scanf("%d", &choice);
 
      switch (choice) {
      case 1:
         do {
            new_node = get_node();
            printf("\nElemanınızı Giriniz ");
            scanf("%d", &new_node->data);
 
            if (root == NULL) 
               root = new_node;
            else
               insert(root, new_node);
 
            printf("\nBaşka eleman istermisiniz?(e/h)");
            ans = getch();
         } while (ans == 'h');
         break;
 
      case 2:
         printf("\nHangi elemanı aramak istersiniz :");
         scanf("%d", &key);
 
         tmp = search(root, key, &parent);
         printf("\n Bu node %d budur %d", tmp->data, parent->data);
         break;
 
      case 3:
         if (root == NULL)
            printf("ağaç olmadı");
         else {
            printf("\nThe Inorder : ");
            inorder(root);
            printf("\nThe Preorder : ");
            preorder(root);
            printf("\nThe Postorder : ");
            postorder(root);
         }
         break;
      }
   } while (choice != 4);
}

 
 
node *get_node() {
   node *temp;
   temp = (node *) malloc(sizeof(node));
   temp->lchild = NULL;
   temp->rchild = NULL;
   return temp;
}

void insert(node *root, node *new_node) {
   if (new_node->data < root->data) {
      if (root->lchild == NULL)
         root->lchild = new_node;
      else
         insert(root->lchild, new_node);
   }
 
   if (new_node->data > root->data) {
      if (root->rchild == NULL)
         root->rchild = new_node;
      else
         insert(root->rchild, new_node);
   }
}

node *search(node *root, int key, node **parent) {
   node *temp;
   temp = root;
   while (temp != NULL) {
      if (temp->data == key) {
         printf("\n %d bu eleman", temp->data);
         return temp;
      }
      *parent = temp;
 
      if (temp->data > key)
         temp = temp->lchild;
      else
         temp = temp->rchild;
   }
   return NULL;
}

void inorder(node *temp) {
   if (temp != NULL) {
      inorder(temp->lchild);
      printf("%d", temp->data);
      inorder(temp->rchild);
   }
}

void preorder(node *temp) {
   if (temp != NULL) {
      printf("%d", temp->data);
      preorder(temp->lchild);
      preorder(temp->rchild);
   }
}
 

void postorder(node *temp) {
   if (temp != NULL) {
      postorder(temp->lchild);
      postorder(temp->rchild);
      printf("%d", temp->data);
   }
}
