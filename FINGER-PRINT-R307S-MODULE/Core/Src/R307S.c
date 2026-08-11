#include "R307S.h"
extern UART_HandleTypeDef huart1;



void Checksensor(){

	uint8_t verifyPacket[] =
	{
	    0xEF, 0x01,              // Header
	    0xFF, 0xFF, 0xFF, 0xFF,  // Address
	    0x01,                    // Packet identifier
	    0x00, 0x07,              // Length
	    0x13,                    // VfyPwd
	    0x00, 0x00, 0x00, 0x00,  // Password
	    0x00, 0x1B          // Checksum
	};



	uint8_t response[12];

	  HAL_Delay(200);
	  HAL_UART_Transmit(&huart1,
	                    verifyPacket,
	                    sizeof(verifyPacket),
	                    HAL_MAX_DELAY);


	  HAL_UART_Receive(&huart1,
	                   response,
	                   12,
					   2000);

	  for(int i=0; i<12; i++){

		  printf("%02X ", response[i]);
	  }
	  printf("\n");


	  if(response[9] == 0x00){
		  printf("%s\n","responds success");
	  }
	  else{
		  printf("%s\n","responds failed!!");
	  }

	  HAL_Delay(20);

}

void Generate_Image(){
	uint8_t genImgPacket[] =
	{
	    0xEF,0x01,
	    0xFF,0xFF,0xFF,0xFF,
	    0x01,
	    0x00,0x03,
	    0x01,
	    0x00,0x05
	};

	uint8_t response[12];
	HAL_UART_Transmit(&huart1,
		                    genImgPacket,
		                    sizeof(genImgPacket),
		                    HAL_MAX_DELAY);


		  HAL_UART_Receive(&huart1,
		                   response,
		                   12,
						   2000);

		  for(int i=0; i<12; i++){
			  printf("%02X ", response[i]);		  }
		  printf("\n");


		  if(response[9] == 0x00){
			  printf("%s\n","Generate image success");
		  }
		  else{
			  printf("%s\n","Generate image failed!!");
			  printf("%s\n","BUG HAPPEN EXIST");
			  while(1);

		  }

}

void Img2Tempbuf1(){
	uint8_t img2tzPacket[] =
	{
	    0xEF,0x01,
	    0xFF,0xFF,0xFF,0xFF,
	    0x01,
	    0x00,0x04,
	    0x02,
	    0x01,
	    0x00,0x08
	};

	    uint8_t response[12];
		HAL_UART_Transmit(&huart1,
				                img2tzPacket,
			                    sizeof(img2tzPacket),
			                    HAL_MAX_DELAY);


			  HAL_UART_Receive(&huart1,
			                   response,
			                   12,
							   2000);

			  for(int i=0; i<12; i++){
				  printf("%02X ", response[i]);			  }

			  printf("\n");


			  if(response[9] == 0x00){
				  printf("%s\n","B1 template success");
			  }
			  else{
				  printf("%s\n","B1 template failed!!");
			  }


}

void Img2Tempbuf2(){
	uint8_t img2tzPacket[] =
	{
	    0xEF,0x01,
	    0xFF,0xFF,0xFF,0xFF,
	    0x01,
	    0x00,0x04,
	    0x02,
	    0x02,
	    0x00,0x09
	};

	    uint8_t response[12];
		HAL_UART_Transmit(&huart1,
				                img2tzPacket,
			                    sizeof(img2tzPacket),
			                    HAL_MAX_DELAY);


			  HAL_UART_Receive(&huart1,
			                   response,
			                   12,
							   2000);

			  for(int i=0; i<12; i++){
				  printf("%02X ", response[i]);			  }
			  printf("\n");

			  if(response[9] == 0x00){
				  printf("%s\n","B2 template success");
			  }
			  else{
				  printf("%s\n","B2 template failed!!");
			  }


}


void Generate_model(){

	uint8_t regModelPacket[] =
	{
	    0xEF, 0x01,
	    0xFF, 0xFF, 0xFF, 0xFF,
	    0x01,
	    0x00, 0x03,
	    0x05,
	    0x00, 0x09
	};

		    uint8_t response[12];
			HAL_UART_Transmit(&huart1,
					regModelPacket,
				                    sizeof(regModelPacket),
				                    HAL_MAX_DELAY);


				  HAL_UART_Receive(&huart1,
				                   response,
				                   12,
								   2000);

				  for(int i=0; i<12; i++){
					  printf("%02X ", response[i]);
				  }
				  printf("\n");

				  if(response[9] == 0x00){
					  printf("%s\n","Generate model success");
				  }
				  else{
					  printf("%s\n","Geenerate model failed!!");
				  }


}


void Flashstore(){
	uint8_t storePacket[] =
	{
	    0xEF, 0x01,             // Header
	    0xFF, 0xFF, 0xFF, 0xFF, // Address
	    0x01,                    // Command packet
	    0x00, 0x06,              // Length
	    0x06,                    // Store instruction
	    0x01,                    // Character Buffer 1
	    0x00, 0x01,              // Page ID = 1
	    0x00, 0x0F               // Checksum
	};

	uint8_t response[12];
				HAL_UART_Transmit(&huart1,
						storePacket,
					                    sizeof(storePacket),
					                    HAL_MAX_DELAY);


					  HAL_UART_Receive(&huart1,
					                   response,
					                   12,
									   2000);

					  for(int i=0; i<12; i++){
						  printf("%02X ", response[i]);
					  }
					  printf("\n");

					  if(response[9] == 0x00){
						  printf("%s\n","Flash storage success");
					  }
					  else{
						  printf("%s\n","Flash storage failed!!");
					  }
}

void search(){
	uint8_t searchPacket[] =
	{
	    0xEF, 0x01,
	    0xFF, 0xFF, 0xFF, 0xFF,
	    0x01,
	    0x00, 0x08,
	    0x04,
	    0x01,
	    0x00, 0x00,
	    0x03, 0xE8,
	    0x00, 0xF9
	};
	Generate_Image();
	Img2Tempbuf1();
	HAL_UART_Transmit(&huart1,
	                  searchPacket,
	                  sizeof(searchPacket),
	                  HAL_MAX_DELAY);
	uint8_t response[18];


						  HAL_UART_Receive(&huart1,
						                   response,
						                   16,
										   2000);

						  for(int i=0; i<18; i++){
							  printf("%02X ", response[i]);
						  }
						  printf("\n");

						  if (response[9] == 0x00)
						  {
						      printf("%s\n","Fingerprint Found\r\n");
						      printf("%02X %02x\n",response[12],response[13]);
						      printf("%02X %02x\n",response[10],response[11]);

						     						  }
						  else
						  {
						      printf("%s","Fingerprint Not Found\r\n");
						  }


}
