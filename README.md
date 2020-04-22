# Speech Processing

This repo consists of 4 subprojects from the assignature <86.53 - Procesamiento del Habla> from the Electronic Engineer Career of the University of Buenos Aires. They are:

* Linear Predictive Coding (LPC)
* Cepstrum
* K-means, Linear Discriminant Analysis (LDA) and Expectation Maximization (EM)
* HTK: Speech Recognition Toolkit (Cambridge University)

# Subprojects

## Linear Predictive Coding (LPC)

This technique is applied in different applications such as VoIP and speech synthesis. It can also be used in HTK. It calculates the required coefficients to produce the envelope of the signal and sends them through a channel in order to be reconstructed by the receiver. This makes an efficient use of the channel.

![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/linear-predictive-coding/results/ej_fantasia_v3_01.png?raw=true">
![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/linear-predictive-coding/results/ej_fantasia_v3_03.png?raw=true">

##### Results: https://htmlpreview.github.io/?https://github.com/fedeboco/speech-processing/blob/master/linear-predictive-coding/results/results.html

## Cepstrum

Cepstral Analysis is applied to study formants in speech.

## K-means, Linear Discriminant Analysis (LDA) and Expectation Maximization (EM)

This three methods are essential in order to work with speech recognition. Either of them estimate the formants of vowels. In this subproject, only the first 2 formants are considered in order to achieve a better visualization of the phenomenon. More formants can be estimated, although 2 formants are usually enough to recognize speech properly. 

Both K-means and EM are iterative, they train the model based on training samples until the error between the real formants and the estimated ones go below a certain threshold. This iterations are shown below in the "iteración" plots. Once the error is minimal, the iterations stop. Also, the initial estimation value can be based on some true samples (calculating the mean of them), or it can also be a random value. That's why K-means and EM are plotted twice in the results html file, one for each initialization method.

![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/kmeans-LDA-EM/resultados/practica6_v8_01.png?raw=true">
![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/kmeans-LDA-EM/resultados/practica6_v8_03.png?raw=true">
![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/kmeans-LDA-EM/resultados/practica6_v8_04.png?raw=true">
![]()<p align="center"><img src="https://github.com/fedeboco/speech-processing/blob/master/kmeans-LDA-EM/resultados/practica6_v8_05.png?raw=true">
</p>

##### Results: https://htmlpreview.github.io/?https://github.com/fedeboco/speech-processing/blob/master/kmeans-LDA-EM/resultados/resultados.html

## HTK: Speech Recognition Toolkit (Cambridge University)

This toolkit is used in order to train a speech recognition system using cepstrum coefficients, Baum-Welch algorithm (similar to EM), the Viterbi algorithm and Markov Chains in order to recognize speech. This subproject consists of two parts:

* Training and testing the model using the Latino40 database licensed to my university.
* Recording my voice and testing the system for a finite-grammar phone-call system, which allows to make phone calls just using voice.

##### Training and testing of the model is ploted below, being the plot the percentage of correct words and sentences in function of number of gaussians used to train the model.

![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/HTK-speech-recognition/results-assets/resultados.jpg?raw=true">

##### Testing of the finite-grammar phone call system with my voice samples are ploted below, being the plot the percentage of correct words and sentences in function of number of gaussians used to train the model. This time the results are better because the grammar for a phone-call system is considerably smaller than the trained dictionary. It's properly application-focused, which makes it more accurate.

![]()<img src="https://github.com/fedeboco/speech-processing/blob/master/HTK-speech-recognition/results-assets/resultadosgf.jpg?raw=true">

##### The whole process is explained here:

##### Results: https://github.com/fedeboco/speech-processing/blob/master/HTK-speech-recognition/results.pdf
