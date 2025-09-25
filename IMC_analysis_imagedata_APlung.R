library(exiftoolr)
library(stringr)
# check the path .in the right docker 
# Script used to extract filename, height and width of images
base = "/mnt/Data1/groupfebe/runs/Xiaofei/APLung/Projectfile/Normalization"
image_path = file.path(base,"full_stack.ome/")
#image_path="/mnt/Data1/imcyto/runs/Xiaofei/APLung/Projectfile/Normalization/full_stack.ome/"
output_path = file.path(base, "imagemetadata.csv")



image_metadata = exif_read(path = file.path(image_path, list.files(image_path)))
image_metadata = image_metadata[,c("FileName", "ImageWidth", "ImageHeight")]
colnames(image_metadata) = c("filename", "width", "height")
image_metadata$filename = str_remove(string = image_metadata$filename,
                                     pattern = "_full_stack.ome.tiff")
View(image_metadata)
write.csv(image_metadata, file = output_path, row.names = F)



