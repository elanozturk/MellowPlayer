#pragma once
#include <fakeit.hpp>
#include <memory>
#include <MellowPlayer/Application/Notifications/INotificationPresenter.hpp>

USING_MELLOWPLAYER_NAMESPACE(Application)
using namespace fakeit;

class NotificationPresenterMock {
public:
    static Mock<INotificationPresenter> get() {
        Mock<INotificationPresenter> mock;
        Reset(mock);
        return mock;
    }

    static void Reset(Mock<INotificationPresenter>& mock) {
        mock.Reset();
        When(Method(mock, initialize)).AlwaysReturn();
        When(Method(mock, display)).AlwaysReturn(true);
    }
};
