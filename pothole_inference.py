from pyvirtualdisplay import Display
from mss import mss
from PIL import Image
import cv2
import numpy as np
from ultralytics import YOLO  # Certifique-se de que o YOLOv8 está instalado corretamente

# Inicializar o modelo YOLO
model = YOLO("best.pt")  # Substitua pelo caminho do seu modelo treinado, se necessário

# Configuração da captura de tela
monitor = {
    "top": 100,    # Coordenada superior da área a ser capturada
    "left": 100,   # Coordenada esquerda da área a ser capturada
    "width": 1280, # Largura da área a ser capturada
    "height": 720  # Altura da área a ser capturada
}

# Iniciar o display virtual
display = Display(visible=0, size=(1280, 720))  # Configure o tamanho conforme necessário
display.start()

sct = mss()  # Inicializar captura de tela

# Loop de inferência em tempo real
try:
    while True:
        # Capturar a tela
        screenshot = sct.grab(monitor)
        frame = np.array(screenshot)

        # Converter o frame de BGRA para RGB
        frame = cv2.cvtColor(frame, cv2.COLOR_BGRA2RGB)

        # Realizar inferência com o modelo YOLO
        results = model.predict(frame, stream=True)  # Use stream=True para resultados otimizados

        # Processar e exibir os resultados
        for result in results:
            annotated_frame = result.plot()  # Adicionar anotações no frame

        # Exibir o frame anotado
        cv2.imshow("Detecção em Tempo Real", annotated_frame)

        # Parar o loop ao pressionar a tecla 'q'
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

except KeyboardInterrupt:
    print("Inferência interrompida pelo usuário.")

finally:
    # Limpar recursos
    cv2.destroyAllWindows()
    display.stop()