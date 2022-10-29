ds = imageDatastore("E:\FYP\Extra\DATA\sample_resize");
I = readall(ds);
for i = [1:length(I)]
    INPEA{i} = NPEA(I{i});
    subplot(1,2,1), imshow(I{i})
    subplot(1,2,2), imshow(INPEA{i})
    pause
end







