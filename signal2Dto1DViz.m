function [] = signal2Dto1DViz(images,dim,value, labels)
%SIGNAL2DTO1D affiche le diagramme selon une ligne ou une colonne des
%différentes images de l'array images
    if dim=="l"
        image=images{1};
        figure(10)
        imagesc(image);colormap gray; colorbar;line([1,size(image,2)],[value,value]);
        x=1:size(image,2);
        figure(11);
        hold on
        for i=1:length(images)
            image = images{i};
            plot(x,image(value, :))
        end
        lgd = legend(labels);
        title(lgd,"Signaux représentés");
        title("Représentation de l'intensité selon la ligne " + value);
        xlabel("Colonne");
        ylabel("Intensité");
        hold off
    else
        image=images{1};
        figure(10)
        imagesc(image);colormap gray; colorbar;line([value,value],[1,size(image,1)]);
        x=1:size(images{1},1);
        figure(11);
        hold on
        for i=1:length(images)
            image = images{i};
            plot(x,image(:, value))
        end
        lgd = legend(labels);
        title(lgd,"Signaux représentés");
        title("Représentation de l'intensité selon la Colonne " + value);
        xlabel("Ligne");
        ylabel("Intensité");
        hold off
    end
end

