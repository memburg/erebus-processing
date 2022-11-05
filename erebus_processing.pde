// image to be encrypted
PImage img;

// image properties
int rows; // number of
int columns; // number of
int[] encryptionKey;

void settings() {
  // load image
  img = loadImage("./media/lenna.png");
  
  // set image properties (globally)
  rows = img.height;
  columns = img.width;
  
  // set canvas size
  size(columns, rows);
  
  // create a new encryption key
  encryptionKey = generateEncryptionKey(rows * 2, rows);
}

void setup() {
  noLoop();
}

void draw() {
  encrypt(img, encryptionKey);
  set(0, 0, img);
}

// This eventualy will be modified, for now, it only
// generates a key to modify the image rows.
int[] generateEncryptionKey(int x, int maxRange) {
  int[] encryptionKey = new int[x];
  
  // populate encryption key
  for(int i = 0; i < x; i++) {
    encryptionKey[i] = int(random(maxRange));
  }
  
  return encryptionKey;
}

void swapRow(PImage img, int n) {
  color[] row = new color[width];
  
  for(int i = 0; i < width; i++) {
    row[i] = img.get(i, n);
  }
  
  row = reverse(row);
  
  for(int i = 0; i < width; i++) {
    img.set(i, n, row[i]);
  }
}

void swapColumn(PImage img, int n) {
  color[] column = new color[height];
  
  for(int i = 0; i < height; i++) {
    column[i] = img.get(n, i);
  }
  
  column = reverse(column);
  
  for(int i = 0; i < height; i++) {
    img.set(n, i, column[i]);
  }
}

void encrypt(PImage img, int[] encryptionKey) {
  int i = 0;
  
  while(i < encryptionKey.length) {
    swapColumn(img, encryptionKey[i]);
    i++;
  }
}
