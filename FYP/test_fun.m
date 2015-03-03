function test_fun(handle, event, node)
    message = event.JavaEvent.getSource;
    a = message.getData();
    data = a.array;
    I = typecast(data(a.arrayOffset+1:end), 'uint8');
    I = cat(3, reshape(I(3:3:end),[640 480])', ...
        reshape(I(2:3:end),[640 480])', ...
        reshape(I(1:3:end),[640 480])'...
    );
    disp('Message');
    
    
    I=rgb2gray(I); % convert the image to grey 

    A = fft2(double(I)); % compute FFT of the grey image
    A1=fftshift(A); % frequency scaling
    
    imshow(A1);
     %assignin(ws, 'var', msg);
end