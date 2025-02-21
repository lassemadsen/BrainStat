function s=minus(t1,t2)
if (~isa(t1,'FixedEffect') && numel(t1)>1) || (~isa(t2,'FixedEffect') && numel(t2)>1)
    warning('If you don''t convert vectors to terms you can get unexpected results :-(') 
end
t1=FixedEffect(t1,inputname(1), false);
t2=FixedEffect(t2,inputname(2), false);
if isempty(t1) || isempty(t2)
    s=t1;
    return
end
n1=size(t1.matrix,1);
n2=size(t2.matrix,1);
n=max(n1,n2);
if n1==1
    t1.matrix=repmat(t1.matrix,n,1);
end
if n2==1
    t2.matrix=repmat(t2.matrix,n,1);
end
m1=t1.matrix./repmat(sum(abs(t1.matrix)),n,1);
m2=t2.matrix./repmat(sum(abs(t2.matrix)),n,1);
[~,i1]=setdiff(m1',m2','rows');
i1=sort(i1);

s = FixedEffect(t1.matrix(:,i1), t1.names(i1), false, false);


% s.names=t1.names(i1);
% s.matrix=t1.matrix(:,i1);
% s=class(s,'FixedEffect');
end

