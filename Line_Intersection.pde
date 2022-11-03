ArrayList<Line> lines = new ArrayList<Line>();

class Line {
  Point p1,p2;
  
  public Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  public Point compare(Line l) {    
    float d = (p1.x-p2.x)*(l.p1.y-l.p2.y) - (p1.y-p2.y)*(l.p1.x-l.p2.x);
    
    float px = (p1.x * p2.y - p1.y * p2.x) * (l.p1.x-l.p2.x) - (p1.x - p2.x) * (l.p1.x * l.p2.y - l.p1.y * l.p2.x);
    float py = (p1.x * p2.y - p1.y * p2.x) * (l.p1.y-l.p2.y) - (p1.y - p2.y) * (l.p1.x * l.p2.y - l.p1.y * l.p2.x);
    
    if ((px/d > p1.x && px/d < p2.x) && (px/d > l.p1.x && px/d < l.p2.x)) return new Point(px/d,py/d);
    return null;
  }
}

class Point {
  float x,y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void drawPoint() {
    circle(x,y,5);
  }
}

public void createLine(float x1, float y1, float x2, float y2) {
  lines.add(new Line(new Point(x1,y1), new Point(x2,y2)));  
}

public void drawLines() {
  for(int i=0;i<lines.size();i++) {
    line(lines.get(i).p1.x,lines.get(i).p1.y,lines.get(i).p2.x,lines.get(i).p2.y);  
  }
}

public void setup() {
  size(500,500);
  createLine(50,50,200,400);
  createLine(100,100,300,200);
}

public void draw() {
  background(255);
  
  fill(0);
  stroke(0);
  drawLines();
  for (int i=0;i<lines.size();i++) {
    Point p = new Line(new Point(0,500),new Point(mouseX,mouseY)).compare(lines.get(i));
    if (p != null) {
      fill(255,0,0);
      p.drawPoint();
    }
  }
  fill(0);
  line(0,500,mouseX,mouseY);
}
