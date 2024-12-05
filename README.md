# Detecção de Deformidades na Pavimentação Urbana Utilizando Modelos de Aprendizado Profundo

## Autores

- **Eduardo Dias Peixoto - 22010395**
- **Pedro Oliveira Coelho - 202108786**  
- **Luiany Gonsalves Carvalho - 202303351**  

## Resumo

Este trabalho aborda a aplicação de modelos de aprendizado profundo na detecção de deformidades na pavimentação urbana, com o objetivo de auxiliar órgãos competentes na identificação e resolução de problemas de maneira mais assertiva e econômica. Utilizando um dataset anotado previamente e o modelo YOLOv8, realizamos o treinamento e validação para detecção de buracos. A metodologia abrangeu o pré-processamento dos dados, configuração do modelo e avaliação com métricas específicas da área. Este relatório descreve os fundamentos teóricos, a implementação prática e os resultados obtidos.

**Palavras-chave**: Detecção de Buracos, Pavimentação Urbana, YOLOv8, Aprendizado Profundo, Redução de Custos.

---

# Seção I. Introdução e Revisão Bibliográfica

## Introdução

A manutenção de vias públicas é um desafio enfrentado por muitas cidades, especialmente no que se refere à identificação rápida e precisa de deformidades, como buracos, que impactam negativamente a segurança viária e o custo de reparos. Métodos manuais de inspeção, além de onerosos, são sujeitos a erros e baixa escalabilidade.

Este trabalho utiliza aprendizado profundo, especificamente o modelo YOLOv8, para a detecção de buracos na pavimentação urbana. O objetivo é fornecer uma solução automatizada e eficiente para identificar problemas estruturais, permitindo aos órgãos competentes priorizar intervenções e reduzir custos operacionais.

## Problema

O problema estudado é a identificação automática de buracos em pavimentação urbana a partir de imagens capturadas por dispositivos móveis ou drones. Os desafios incluem variabilidade de iluminação, diferentes tipos de pavimentação e obstruções visuais, como sujeira e sombras.

## Revisão Bibliográfica

Algumas fontes relevantes exploradas incluem:

1. **Redmon, J. et al. "You Only Look Once: Unified, Real-Time Object Detection"**  
   Introdução ao modelo YOLO, que combina alta precisão com eficiência em tempo real para detecção de objetos em imagens [1].
   
2. **Bochkovskiy, A. et al. "YOLOv4: Optimal Speed and Accuracy of Object Detection"**  
   Avanços na arquitetura YOLO, que culminaram na série YOLOv5 e YOLOv8, com melhorias em velocidade e desempenho [2].
   
3. **Zhu, Z. et al. "Deep Learning-Based Pavement Distress Detection"**  
   Estudo de técnicas específicas para identificação de falhas em pavimentação, incluindo aprendizado supervisionado e não supervisionado [3].
   
4. **Papers With Code: Object Detection**  
   Repositório com métricas e comparações entre os modelos mais recentes para detecção de objetos [4].

5. **Postagem em Blog: "YOLOv8 for Custom Object Detection"**  
   Guia prático para treinar o YOLOv8 em datasets personalizados [5].

## Dataset

O dataset utilizado foi retirado da plataforma Kaggle e foi originalmente disponibilizado pelo usuário Raj Dalsaniya. Em relação ao contúdo o dataset contém imagens de pavimentação urbana, previamente anotadas com a localização de deformidades. As imagens já foram divididas em conjuntos de treino e validação.
Seria de bom tom utilizar um dataset mais heterogêneo para o fine-tuning do modelo, visando uma maior assertividade.

---

# Seção II. Fundamentos Teóricos

## Detecção de Objetos com YOLOv8

O YOLOv8 é a versão mais recente da família YOLO (You Only Look Once) e combina rapidez e precisão em tarefas de detecção de objetos. Ele utiliza uma arquitetura baseada em convoluções para processamento de imagens e incorpora técnicas avançadas, como *mosaic data augmentation* e *anchor-free detection*, para melhorar a generalização.

## Métricas de Avaliação

As métricas de avaliação foram reduzidas à comprovação visual e a uma relação percentual baseada em dois critérios principais: a quantidade de deformidades detectadas em relação à quantidade real de anomalias presentes, e a proporção de imagens em que as anomalias foram corretamente identificadas.

Essa abordagem pouco convencional para medir a eficiência do modelo se justifica pelas características do problema e pelo escopo que desejamos abordar. Como o modelo será utilizado para localizar falhas no pavimento, a quantidade e o grau das deformidades tornam-se secundários. Assim, a avaliação prioriza a capacidade do modelo de identificar corretamente as anomalias nas imagens analisadas.

- **Acurácia baseada na quantidade de detecções**: Mede a proporção de deformidades detectadas em relação ao total de anomalias reais presentes.  
- **Acurácia baseada na quantidade de imagens com detecções**: Mede a proporção de imagens em que as anomalias foram corretamente detectadas em relação ao total de imagens analisadas 

---

# Seção III. Metodologia

## Fluxo do Pipeline

1. **Pré-processamento dos Dados**  
   - Organização do dataset com imagens e anotações.  
   - Conversão das anotações para o formato YOLO.  

2. **Configuração do Modelo**  
   - Modelo base: YOLOv8n (versão leve, ideal para protótipos).  
   - Arquivo de configuração: `yolov8n.yaml`.  
   - Hiperparâmetros: 
     - Épocas: 15 
     - Tamanho da imagem: 640px  
     - *Workers*: 4  

3. **Treinamento**  
   - Framework utilizado: Ultralytics YOLOv8.  
   - Divisão do dataset: 80% treino, 20% validação.  

4. **Avaliação**  
   - Métricas: Acurácia baseada na quantidade de detecções, Acurácia baseada na quantidade de imagens com detecções.  

---

# Seção IV. Resultados

## Desempenho do Modelo

- **Acurácia baseada na quantidade de detecções**: 38,10%.  
- **Acurácia baseada na quantidade de imagens com detecções**: 72,73%.  

O modelo demonstrou uma capacidade moderada de generalização nos dados de validação, conseguindo identificar corretamente anomalias em grande parte das imagens analisadas. No entanto, a baixa acurácia baseada na quantidade de detecções reflete a presença de falsos positivos e a dificuldade do modelo em diferenciar deformidades reais de interferências, como sombras, o que comprometeu a precisão geral em nível de detecção.

## Limitações

- O modelo foi treinado com apenas 15 épocas devido a restrições computacionais e de tempo, o que pode ter limitado seu desempenho.  
- O dataset utilizado possui imagens com iluminação e qualidade homogêneas, o que pode não refletir cenários reais mais complexos.  

---

# Seção V. Conclusões e Trabalhos Futuros

## Conclusões

O treinamento do YOLOv8 para detecção de buracos mostrou-se promissor, apresentando desempenho satisfatório mesmo com restrições de treinamento. Este trabalho destaca a viabilidade de aplicar aprendizado profundo na automação de inspeções de pavimentação, reduzindo custos e aumentando a precisão.

## Trabalhos Futuros

- Treinar o modelo com mais épocas para maior robustez.  
- Coletar um dataset mais variado, abrangendo diferentes tipos de pavimentação e condições ambientais.  
- Integrar o modelo a um sistema embarcado para uso em tempo real, como drones ou veículos.  

---

# Referências

[1] J. Redmon et al., "You Only Look Once: Unified, Real-Time Object Detection," _arXiv preprint arXiv:1506.02640_, 2016.  
[2] A. Bochkovskiy et al., "YOLOv4: Optimal Speed and Accuracy of Object Detection," _arXiv preprint arXiv:2004.10934_, 2020.  
[3] Z. Zhu et al., "Deep Learning-Based Pavement Distress Detection," _IEEE Transactions on Intelligent Transportation Systems_, 2019.  
[4] "Object Detection - Papers with Code." Disponível em: [https://paperswithcode.com/task/object-detection](https://paperswithcode.com/task/object-detection).  
[5] "YOLOv8 for Custom Object Detection," _Blog_, 2024. 

# Apêndices

## A. Código Fonte

O código fonte para este projeto está disponível em github.com/diaspeixoto/PDSI-E9

## B. Resultados

<img src="outputs/Pasted image.png" alt="Exemplo de Inferência 1" width="640" />
<img src="outputs/Pasted image (2).png" alt="Exemplo de Inferência 2" width="640" />
<img src="outputs/Pasted image (3).png" alt="Exemplo de Inferência 3" width="640" />



