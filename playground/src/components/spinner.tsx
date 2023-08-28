import * as React from 'react';

interface SpinnerProps {
    className?: string;
}

export class Spinner extends React.Component<SpinnerProps> {
    constructor(props: SpinnerProps) {
        super(props);
    }

    public render() {
        return (
            <div className=" cue-spinner">
                <div className="cue-spinner__item"></div>
                <div className="cue-spinner__item"></div>
                <div className="cue-spinner__item"></div>
                <p className="cue-spinner__text">loading</p>
            </div>
        );
    }
}
