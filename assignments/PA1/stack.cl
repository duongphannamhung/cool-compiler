class Main inherits IO {
   flag : Bool ;
   input : String;
   currValue: String;
   counter: Int;
   
   head: Stack;

   tempPop: Stack;
   tempPush: String;
   tempPrint: Stack;

   number1: String;
   number2: String;

   a2iObj:A2I;

   main():Object{{
      a2iObj <- new A2I;
      flag <- true;
      counter <- 0;

      out_string("Commands available\n1.<int>\n2.+\n3.s\n4.e\n5.d\n6.x\n");

      while flag loop
      {
         out_string("> ");
         input<-in_string();
         if input = "x" then {
            out_string("\nTerminating ....\n");
            flag<-false;
            }
         else
            if input = "e" then {
               if 0 < counter then {
                  currValue <- popStack();
                  if currValue = "+" then
                     if counter < 2 then {
                        out_string("\nImproper Stack .Not enough integers\nAborting ...\n");
                        abort();
                     }
                     else {
                        number1 <- popStack();
                        number2 <- popStack();
                        pushStack(a2iObj.i2a(a2iObj.a2i(number1) + a2iObj.a2i(number2)));
                     }
                     fi
                  else
                     if currValue = "s" then {
                        number1 <- popStack();
                        number2 <- popStack();
                        pushStack(number1);
                        pushStack(number2);
                     } 
                     else
                        pushStack(currValue)
                     fi
                  fi;
               }
               else
                  out_string("Nothing to pop\n")
               fi;
            }
            else
               if input = "d" then printStack()
               else pushStack(input)
               fi
            fi
         fi;
      }
      pool;
   }};

   pushStack(value:String):Object {{
      counter <- counter+1;
      tempPop <- new Stack;
      tempPop.init(value);
      if counter = 1 then head <- tempPop 
      else {
         tempPop.addNext(head);
         head <- tempPop;
      }
      fi;
   }};

   popStack(): String {{
      counter <- counter-1;
      tempPush <- head.getValue();
      head <- head.getNext();
      tempPush;
   }};   

   printStack():Object{{
		tempPrint<-head;

		-- out_string("The stack now is :\n");

		while not isvoid tempPrint loop 
		{
         out_string(tempPrint.getValue());
         out_string("\n");
         tempPrint<-tempPrint.getNext();
      }
		pool;
	
	}};

};

class Stack inherits IO {
   
   currValue:String;
   next:Stack;
   init(s : String): Object {
      currValue <- s
   };

   addNext(n:Stack): Object {
      next <- n
   };

   getValue():String{currValue};
   getNext():Stack{next};

};