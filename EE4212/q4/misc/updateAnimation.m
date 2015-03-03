function anim = updateAnimation(anim)
% assume anim contains the matrix P. K, R and t will be updated according
% to P. also assume anim has only two frames.

% Wu Zhe, Jan 10, 2012

% update: add some lines to handle the case rank(anim.P(1:3,1:3,2)) == 2
% Feb 09, 2012

K = zeros(3,3,2);
R = zeros(3,3,2);
t = zeros(3,2);

H = eye(4);
Ptemp = anim.P(:,:,2);
if rcond(Ptemp(:,1:3)) < 1e-10
    [U S V] = svd(Ptemp(:,1:3));
    Vtemp = V(:,3);
    [val,ind] = max(abs(Vtemp));
    H(4,ind(1)) = 1;
end

% update P
anim.P(:,:,1) = anim.P(:,:,1) * H;
anim.P(:,:,2) = anim.P(:,:,2) * H;
% update points
for i = 1:anim.nPoint
    cur_point = ones(4,1);
    cur_point(1:3) = anim.S(:,i);
    cur_point = inv(H) * cur_point;
    cur_point = cur_point / cur_point(4);
    anim.S(:,i) = cur_point(1:3);
end


ind = 1;
[K(:,:,ind),R(:,:,ind),t(:,ind)] = PMatDecompQR(anim.P(:,:,ind));

ind = 2;
[K(:,:,ind),R(:,:,ind),t(:,ind)] = PMatDecompQR(anim.P(:,:,ind));

K_vec = zeros(5,2);
for i = 1:2
    K_vec(:,i) = [K(1,1,i); K(1,2,i); K(2,2,i); K(1,3,i); K(2,3,i)];
end
anim.K = K_vec;
anim.R = R;
anim.t = t;

end

