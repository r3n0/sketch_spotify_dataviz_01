class Line{
    float length;
    float angle;
    float angularSpeed;
    
    Line(float length){
        this.length = length;
        this.angle = random(0, 360);
        this.angularSpeed = random(-0.5, 0.5);
        
    }

    void update(){
        angle += angularSpeed;
    }

    void display(){
        pushMatrix();
        translate(0, 0);
        rotate(radians(angle));
        line(0, 0, length, 0);
        
        circle(length * 2 / 3, 0, 6);
        popMatrix();
    }
}
