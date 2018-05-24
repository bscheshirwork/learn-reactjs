<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="lt" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="wg" tagdir="/WEB-INF/tags/widget" %>
<%@taglib prefix="ce" tagdir="/WEB-INF/tags/application/basics/forms" %>
<%@taglib prefix="app" tagdir="/WEB-INF/tags/application" %>

<a name="pageStart"></a>
<lt:layout cssClass="black-line"/>
<lt:layout cssClass="page hello-world-example-page">
    <h1>2.10 Формы</h1>

    <wg:p>Работа элементов HTML-форм в React немного отличается от работы других DOM-элементов,
        потому что элементы форм по своей природе обладают некоторым внутренним состоянием. К примеру,
        данная форма в нативном HTML принимает только имя:</wg:p>

    <ce:code-example-1/>

    <wg:p>Эта форма имеет поведение HTML-формы по умолчанию: просмотр новой страницы, когда
        пользователь посылает форму. Если вам необходимо это поведение в React, оно работает
        как обычно. Но в большинстве случаев удобно иметь JavaScript-функцию, которая обрабатывает
        отправку формы и имеет доступ к данным, которые пользователь ввел в форму.
        Стандартным способом достижения этой цели является использование подхода
        «контролируемые компоненты».</wg:p>

    <br/>
    <h2>2.10.1 Контролируемые компоненты</h2>

    <wg:p>В HTML-элементы форм, такие как <code>&lt;input&gt;</code>, <code>&lt;textarea&gt;</code>
        и <code>&lt;select&gt;</code> как правило хранят свое собственное состояние и обновляют
        его на основании пользовательского ввода. В React модифицируемое состояние как правило
        является собственностью компонентов и обновляется только с помощью <code>setState()</code>.</wg:p>

    <wg:p>Мы можем скомбинировать эти обе особенности, делая состояние React  “<b>единственным источником
        достоверной информации (истины)</b>”. В свою очередь React-компонент, который отрисовывает форму,
        также контролирует, что происходит на этой форме в ответ на последующий ввод пользователя.
        Элемент ввода формы (например, <code>input</code>), значение которого контролируется React, в этом случае
        называется «контролируемый компонент».</wg:p>

    <wg:p>К примеру, если мы хотим в предыдущем примере делать лог имени, когда форма отправляется, мы можем написать
        форму как контролируемый компонент:</wg:p>

    <ce:code-example-2 codePenUrl="https://codepen.io/stzidane/pen/mwbBmM?editors=0010"/>

    <wg:p>Как  только атрибут <code>value</code> устанавливается на нашем элементе формы
        c <code>name="login"</code>, отображаемое значение будет всегда равно <code>this.state.login</code>,
        делая состояние React источником достоверной информации. Так  как <code>onLoginChange</code> выполняется
        на каждое нажатие клавиши, чтобы обновить состояние компонента, отображаемое значение будет обновляться
        с каждым нажатием, когда пользователь печатает.</wg:p>

    <wg:p>В контролируемом компоненте, любая модификация состояния будет иметь ассоциированную функцию-обработчик.
        Это делает его простым для изменения или проверки данных, вводимых пользователем. К примеру, если мы
        хотим, чтобы логин вводился только в верхнем регистре, мы можем написать <code>onLoginChange</code> как:</wg:p>

    <ce:code-example-3/>

    <br/>
    <h2>2.10.2	Тег textarea</h2>

    <wg:p>В HTML-элемент <code>&lt;textarea&gt;</code> определяет введенный в него текст по его потомкам:</wg:p>

    <ce:code-example-4/>

    <wg:p>В React <code>&lt;textarea&gt;</code> использует значение атрибута <code>value</code> вместо потомков. Таким образом,
        форма, использующая <code>&lt;textarea&gt;</code>, может быть очень просто написана как форма,
        использующая однострочный ввод данных:</wg:p>

    <ce:code-example-5 codePenUrl="https://codepen.io/stzidane/pen/owXvyN?editors=0010"/>

    <wg:p>Обратите внимание, что <code>this.state.value</code> инициализируется в конструкторе,
        поэтому <code>textarea</code> показывается с некоторым текстом в нем.</wg:p>

    <br/>
    <h2>2.10.3	Тег select</h2>

    <wg:p>В HTML тег <code>&lt;select&gt;</code> создает выпадающий список. К примеру
        данный HTML создает выпадающий список языков программирования:</wg:p>

    <ce:code-example-6/>

    <wg:p>Обратите внимание, что первоначально выбрана опция “JavaScript”, потому что задан
        атрибут <code>selected</code>. React вместо использования атрибута <code>selected,</code>
        использует атрибут <code>value</code> на корневом теге <code>select</code>. Это
        удобнее в контролируемом компоненте, потому что вам необходимо обновлять его только в
        одном месте. Например:</wg:p>

    <ce:code-example-7 codePenUrl="https://codepen.io/stzidane/pen/owXvRj?editors=0010"/>

    <wg:p>В целом, это делает работу тегов <code>&lt;input type="text"&gt;</code>,
        <code>&lt;textarea&gt;</code> и <code>&lt;select&gt;</code> очень похожей –
        они все принимают атрибут value, который вы можете использовать, чтобы
        реализовать контролируемый компонент.</wg:p>

    <wg:p>Вы можете передать массив в атрибут <code>value</code>, что позволяет выбрать
     несколько опций в теге <code>select</code>.</wg:p>

    <ce:code-example-8/>

    <br/>
    <h2>2.10.4 Тег input типа file</h2>

    <wg:p>В HTML тег <code>&lt;input type="file"/&gt;</code> позволяет пользователю выбирать один
        или несколько файлов из хранилища своего устройства для загрузки на
        сервер или манипулировать собой с помощью JavaScript через File API.</wg:p>

    <ce:code-example-8.1/>

    <wg:p>
        Поскольку его значение доступно только для чтения, это неконтролируемый компонент
        в React. Он обсуждается вместе с другими неконтролируемыми компонентами
        позже в документации.
    </wg:p>

    <br/>
    <h2>2.10.5	Обработка множества input</h2>

    <wg:p>Когда вам необходимо обрабатывать множество контролируемых элементов <code>input</code>,
        вы можете добавить атрибут <code>name</code> на каждый элемент и позволить
        функции-обработчику выбрать, что делать на основании значения <code>event.target.name</code>.</wg:p>

    <wg:p>Например:</wg:p>

    <ce:code-example-9 codePenUrl="https://codepen.io/stzidane/pen/YQXzpZ?editors=0010"/>

    <wg:p>Обратите внимание, как мы использовали ES6 синтаксис вычисляемого имени свойства,
        чтобы обновить ключ состояния в соответствии с данным именем тега <code>input</code>:</wg:p>

    <ce:code-example-10/>

    <wg:p>Это эквивалент данного ES5 кода:</wg:p>

    <ce:code-example-11/>

    <wg:p>Также, так как <code>setState()</code> автоматически мерджит частичное состояние в текущее
        состояние, нам лишь необходимо вызывать его с изменившейся частью.</wg:p>

    <br/>
    <h2>2.10.5 Пустое значение атрибута value контролируемого input</h2>

    <wg:p>Указание значения этого атрибута на контролируемом компоненте предотвращает изменение пользователем
        значений полей формы до тех пор, пока вы не разрешите. Если вы указали <code>value</code>, но
        <code>input</code> все еще редактируемый, вы могли случайно установить <code>value</code> в
        <code>undefined</code> или <code>null</code>.</wg:p>

    <wg:p>Следующий код демонстрирует это. (Сначала <code>input</code> заблокирован, но становится
        редактируемым после короткой задержки.)</wg:p>

    <ce:code-example-12/>

    <br/>
    <h2>2.10.6	Альтернативы контролируемым компонентам</h2>

    <c:url var="uncontrolledComponentsUrl" value="/core/uncontrolled-components"/>
    <wg:p>Иногда может быть утомительным использовать контролируемые компоненты, потому
        что вам необходимо написать обработчик события для каждого случая изменения ваших
        данных и пропустить все состояния <code>input</code>-ов через React-компонент. Это может стать
        особенно раздражающим, когда вы преобразовываете предшествующую кодовую базу в React,
        или интегрируете React-приложение с не-React библиотекой. В этих ситуациях вам,
        возможно, стоит рассмотреть <wg:link href="${uncontrolledComponentsUrl}">неконтролируемые компоненты</wg:link>,
        альтернативный метод реализации форм ввода.</wg:p>
</lt:layout>

<c:url var="prevPageUrl" value="lists-and-keys"/>
<c:url var="nextPageUrl" value="lifting-state-up"/>
<app:page-navigate prevPageUrl="${prevPageUrl}"
                   pageStartAncor="pageStart"
                   nextPageUrl="${nextPageUrl}"/>