function new_pro=order(old_pro,pro_length)
    Pos1=ceil(rand*pro_length);
    Pos2=ceil(rand*pro_length);
    while Pos1==Pos2
        Pos2=ceil(rand*pro_length);
    end
    temp=old_pro(Pos1);
    old_pro(Pos1)=old_pro(Pos2);
    old_pro(Pos2)=temp;
    new_pro=old_pro;
end