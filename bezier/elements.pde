ArrayList<Command> commands = new ArrayList<Command>();

void drawBot(Vector2D pos, double rot) {
  pushMatrix();
  translate((float)pos.x, (float)pos.y);
  rotate((float)rot);
  stroke(255, 0, 0, 50);
  fill(255, 0, 0, 50);
  image(botrot, -botrot.width/2*botRotScale, -botrot.height/2*botRotScale, botrot.width*botRotScale, botrot.height*botRotScale);
  if(skidding && simulation)
    rect(-botrot.width/2*botRotScale, -botrot.height/2*botRotScale, botrot.width*botRotScale, botrot.height*botRotScale);
  popMatrix();
  stroke(0, 0, 0);
}

void addCommand(String c){
  c = c.trim();
  if(c.length() >= 5)
    if(c.substring(c.length()-5).equals(".java"))
      c = c.substring(0, c.length()-5);
  commands.add(new Command(c));
}

void setCommandT(double t){
  commands.get(commands.size()-1).setT(t);
}

class Command{
  private String name;
  private double t;
  
  Command(String name){
    this.name = name;
  }
  Command(String name, double t){
    this.name = name;
    this.t = t;
  }
  void setT(double t){this.t = t;}
  void setName(String name){this.name = name;}
  
  String getName(){return name;}
  double getT(){return t;}
}
