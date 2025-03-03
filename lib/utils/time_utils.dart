String getElapsedTime(Duration difference){
   if (difference.inDays>365){
      final years=difference.inDays~/365;
      if (years<2){
        return "$years years";
      }
   return "Long Time Ago";
      }

   if (difference.inDays>0 ){
           if (difference.inDays>30){
        return "${difference.inDays~/30} m";
      }
           
 return "${difference.inDays}d";

    }
    if (difference.inHours>0){
      return "${difference.inHours} h";
    }
    if (difference.inMinutes>0){
      return "${difference.inMinutes} min";
    }
    if (difference.inSeconds>0){
    if (difference.inSeconds<30){
      return "Just now";
    }
   
   }
  return  "Just now";
  
  }

