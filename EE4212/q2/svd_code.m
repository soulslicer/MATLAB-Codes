
% Second part
images = [];
for n=1:150
  image = im2double(imread(sprintf('image%03d.png',n)));
  vector = reshape(image,[42021,1]);
  m = mean(vector);
  vector = vector - m;
  images = [images,vector];
  %for 
end

[U S V]=svd(images);

% First part
% first_image = im2double(imread(sprintf('image%03d.png',1)));
% [U S V]=svd(first_image);
% plot(diag(S),'b');
% 
% K=20;
% Sk=S(1:K,1:K);
% Uk=U(:,1:K);
% Vk=V(:,1:K);
% Imk=Uk*Sk*Vk';
% imshow(Imk)